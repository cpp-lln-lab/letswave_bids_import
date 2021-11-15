function printCredits(cfg)
    %
    % TODO: use the .zenodo.json to load contributors
    %
    % (C) Copyright 2021 Remi Gau

    version_number = getVersion();

    contributors = {'Remi Gau'};

    % DOI_URL = 'https://doi.org/';

    if cfg.verbose

        splash = 'Thank you for using lets wave bids import - version %s. ';
        fprintf(splash, version_number);
        fprintf('\n\n');

        fprintf('Current list of contributors includes\n');
        for iCont = 1:numel(contributors)
            fprintf(' %s\n', contributors{iCont});
        end
        fprintf('\b\n\n');

        % fprintf('Please cite using the following DOI: \n %s\n\n', DOI_URL);

        fprintf('For bug report & suggestions see our github repo: \n %s\n\n', repoURL());

        disp('___________________________________________________________________________');
        disp('___________________________________________________________________________');

        fprintf('\n\n');

    end

end
