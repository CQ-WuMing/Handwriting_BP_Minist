clc
clear

%读取MNIST数据集中的图片
train_images = readMNISTImages('train-images.idx3-ubyte'); %60000个训练集,大小为28*28*60000
test_images =  readMNISTImages('t10k-images.idx3-ubyte');  %10000个训练集,大小为28*28*10000

%读取MNIST数据集中的标签
train_labels = readMNISTLabels('train-labels.idx1-ubyte');%标签0~9；60000个标签，大小为60000*1
test_labels = readMNISTLabels('t10k-labels.idx1-ubyte'); %10000个标签，大小为10000*1

%数据预处理，归一化，除255是因为灰度值在0到255中间
train_img=reshape(train_images,28*28,60000)./255;
test_img=reshape(test_images,28*28,10000)./255;

%%
%标签lables进行独热编码
train_labels_m=zeros(10,60000);
test_labels_m=zeros(10,10000);
for i=1:60000
    train_labels_m((train_labels(i)+1),i)=1;
end
for i=1:10000
     test_labels_m((test_labels(i)+1),i)=1;
end

%%
%训练神经网络
[w,b,w_h,b_h]=train(train_img,train_labels_m);
%保存神经网络
save( 'net.mat', 'w','b','w_h','b_h' );
 
%%
%在测试集上进行识别计算准确率
acc0=test(test_img,test_labels,w,b,w_h,b_h);
acc0 = acc0 / 100;%转为百分制
fprintf('正确率：%.2f%%\n',acc0); 
%%
app1();%调用app
