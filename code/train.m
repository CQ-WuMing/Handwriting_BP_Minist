%此函数为训练函数
function[w,b,w_h,b_h]=train(x_train,y_train)
step = 5;%迭代次数
a = 0.5;%学习率
in = 784; %输入神经元个数,因为数据集是28*28=784的像素，故为784
hid = 30;%隐藏层神经元个数
out = 10; %输出层神经元个数，因为输出是0到9，10个数字

%先随机生成的权重与偏置
w = randn(out,hid);
b = randn(out,1);
w_h =randn(hid,in);
b_h = randn(hid,1);


for i=0:step
    %打乱训练样本
    r=randperm(60000);
    x_train = x_train(:,r);
    y_train = y_train(:,r);

    for j=1:60000
        x = x_train(:,j);
        y = y_train(:,j);

        hid_put = layerout(w_h,b_h,x);
        out_put = layerout(w,b,hid_put);

        %更新公式的实现
        o_update = (y-out_put).*out_put.*(1-out_put);
        h_update = ((w')*o_update).*hid_put.*(1-hid_put);

        outw_update = a*(o_update*(hid_put'));
        outb_update = a*o_update;
        hidw_update = a*(h_update*(x'));
        hidb_update = a*h_update;
        

        %经过训练后的权重偏差
        w = w + outw_update;
        b = b+ outb_update;
        w_h = w_h +hidw_update;
        b_h =b_h +hidb_update;

        
    end
    fprintf('已训练%d次共%d次\n',i,step);
end  

end 