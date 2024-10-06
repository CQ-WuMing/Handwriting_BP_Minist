clc
clear

%��ȡMNIST���ݼ��е�ͼƬ
train_images = readMNISTImages('train-images.idx3-ubyte'); %60000��ѵ����,��СΪ28*28*60000
test_images =  readMNISTImages('t10k-images.idx3-ubyte');  %10000��ѵ����,��СΪ28*28*10000

%��ȡMNIST���ݼ��еı�ǩ
train_labels = readMNISTLabels('train-labels.idx1-ubyte');%��ǩ0~9��60000����ǩ����СΪ60000*1
test_labels = readMNISTLabels('t10k-labels.idx1-ubyte'); %10000����ǩ����СΪ10000*1

%����Ԥ������һ������255����Ϊ�Ҷ�ֵ��0��255�м�
train_img=reshape(train_images,28*28,60000)./255;
test_img=reshape(test_images,28*28,10000)./255;

%%
%��ǩlables���ж��ȱ���
train_labels_m=zeros(10,60000);
test_labels_m=zeros(10,10000);
for i=1:60000
    train_labels_m((train_labels(i)+1),i)=1;
end
for i=1:10000
     test_labels_m((test_labels(i)+1),i)=1;
end

%%
%ѵ��������
[w,b,w_h,b_h]=train(train_img,train_labels_m);
%����������
save( 'net.mat', 'w','b','w_h','b_h' );
 
%%
%�ڲ��Լ��Ͻ���ʶ�����׼ȷ��
acc0=test(test_img,test_labels,w,b,w_h,b_h);
acc0 = acc0 / 100;%תΪ�ٷ���
fprintf('��ȷ�ʣ�%.2f%%\n',acc0); 
%%
app1();%����app
