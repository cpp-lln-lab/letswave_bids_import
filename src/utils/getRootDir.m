function root_dir = getroot_dir()
    %
    % (C) Copyright 2021 Remi Gau

    root_dir = fullfile(fileparts(mfilename('fullpath')), '..', '..');

end
