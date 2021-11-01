function test_suite = test_import_bids %#ok<*STOUT>
    % (C) Copyright 2021 Remi Gau
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions = localfunctions(); %#ok<*NASGU>
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;
end

function test_import_bids_basic()

    clean_dir();

    cfg.out_path = fullfile(this_dir(), 'output');

    cfg.bidsroot = fullfile(return_test_data_dir(), 'eeglab');

    initialize_letswave();
    close all;

    import_bids(cfg);

end

function clean_dir()
    if exist(fullfile(this_dir(), 'output'), 'dir')
        rmdir(fullfile(this_dir(), 'output'), 's');
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
