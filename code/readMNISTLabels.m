%�˺����Ƕ�ȡ���ݼ���ǩ�ĺ���
function labels = readMNISTLabels(filename)
fid = fopen(filename,'r');
%��ȡǰ���ֽ�
magic = fread(fid,1,'int32',0,'ieee-be');
numLabels = fread(fid,1,'int32',0,'ieee-be');
%��ȡ��ǩ
labels = fread(fid,Inf,'unsigned char');
labels = labels';
fclose(fid);
end


