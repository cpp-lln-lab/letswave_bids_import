function import_bids(cfg)
    %
    %
    %
    % USAGE
    %
    % EXAMPLE
    %
    % (C) Copyright 2021 Remi Gau

    cfg.force = true;
    cfg.skip_dep = true;
    cfg.verbose = true;
    cfg.use_schema = true;

    cfg.filter = struct();

    BIDS = bids.layout(cfg.bidsroot);

    pipeline_name = 'letswave_bids_import';

    bids.copy_to_derivative(BIDS, pipeline_name, ...
                            cfg.out_path, ...
                            cfg.filter, ...
                            'unzip', false, ...
                            'force', cfg.force, ...
                            'skip_dep', cfg.skip_dep, ...
                            'use_schema', cfg.use_schema, ...
                            'verbose', cfg.verbose);

    BIDS = bids.layout(fullfile(cfg.out_path, pipeline_name));

    BIDS.description.GeneratedBy.Version = getVersion();
    BIDS.description.GeneratedBy.Description = 'Import data and convert to lets wave format';
    BIDS.description.GeneratedBy.CodeURL = repoURL();

    bids.util.jsonwrite(fullfile(cfg.out_path, pipeline_name, 'dataset_description.json'), ...
                        BIDS.description);

    files = bids.query(BIDS, 'data', ...
                       'suffix', 'eeg', ...
                       'extension', {'.set', '.bdf', '.edf', '.eeg'});

    for iFile = 1:size(files, 1)

        [~, ~, ext] = fileparts(files{iFile});

        switch ext
            case '.set'
                configuration = LW_import_SET('default');

                configuration.parameters.filenames = {files{iFile}};

                [~, datasets] = LW_import_BDF('process', configuration);

                save_data(files{iFile}, datasets);

                delete(files{iFile});

            otherwise
                % TODO
                warning('FORMAT NOT YET SUPPORTED');

        end
    end

end

function save_data(filename, datasets)

    % save header
    header = datasets.header; %#ok<*NASGU>
    new_filename = bids.internal.file_utils(filename, 'ext', '.lw5');
    disp(['saving ', new_filename]);
    save(new_filename, '-MAT', 'header');

    % save data
    data = datasets.data;
    new_filename = bids.internal.file_utils(filename, 'ext', '.mat');
    save(new_filename, '-MAT', 'data');

end
