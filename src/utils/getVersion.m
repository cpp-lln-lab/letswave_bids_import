function version_number = getVersion()
    %
    % Reads the version number of the pipeline from the txt file in the root of the
    % repository.
    %
    % USAGE::
    %
    %   version_number = getVersion()
    %
    % :returns: :version_number: (string) Use semantic versioning format (like v0.1.0)
    %
    % (C) Copyright 2021 Remi Gau

    try
        version_number = fileread(getroot_dir(), 'version.txt');
    catch
        version_number = 'v0.1.0';
    end
end
