function test_suite = test_importBids %#ok<*STOUT>
    % (C) Copyright 2021 Remi Gau
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions = localfunctions(); %#ok<*NASGU>
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
end

function test_import_bids_eeglab()

    cfg.out_path = fullfile(this_dir(), 'output', 'eeglab');
    
    clean_dir(cfg.out_path);

    cfg.bidsroot = fullfile(return_test_data_dir(), 'eeglab');

    initialize_letswave();
    close all;

    importBids(cfg);
    
    % TODO 
    % add tests
    
%     clean_dir();

end

function test_import_bids_biosemi()

    cfg.out_path = fullfile(this_dir(), 'output', 'biosemi');
    
    clean_dir(cfg.out_path);

    cfg.bidsroot = fullfile(return_test_data_dir(), 'spm_multimodal');

    initialize_letswave();
    close all;

    importBids(cfg);
    
    % TODO 
    % add tests
    
%     clean_dir();

end

function clean_dir(this_dir)
    if exist(this_dir, 'dir')
        rmdir(this_dir, 's');
    end
end

function data_dir = return_test_data_dir()
    data_dir = fullfile(this_dir(), 'data', 'eeg_bids_conversion', 'demos');
end

function d = this_dir()
    d = fileparts(mfilename('fullpath'));
end

function initialize_letswave()
    addpath('/home/remi/github/letswave6');
    letswave6;
end
