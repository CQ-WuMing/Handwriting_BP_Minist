%此函数是读取数据集标签的函数
function labels = readMNISTLabels(filename)
fid = fopen(filename,'r');
%读取前八字节
magic = fread(fid,1,'int32',0,'ieee-be');
numLabels = fread(fid,1,'int32',0,'ieee-be');
%读取标签
labels = fread(fid,Inf,'unsigned char');
labels = labels';
fclose(fid);
end


