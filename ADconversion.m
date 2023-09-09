myFolder = 'The directory of the audio datasets of the folder'
if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir();
    if myFolder == 0
         return;
    end
end
filePattern = fullfile(myFolder, '*.wav'); 
theFiles = dir(filePattern);

for k = 1 : 100
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    [data, fs] = audioread(fullFileName,'native');
    data = downsample(data,2);
    d_max = max(data)
    d_min = min(data)
    data = cast(data,"double")
    data = data + 32767
    data = cast(data, "uint16")
    writematrix(data,sprintf('%d.txt', k))

    clear data fs
end
fprintf("done")