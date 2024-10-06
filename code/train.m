%�˺���Ϊѵ������
function[w,b,w_h,b_h]=train(x_train,y_train)
step = 5;%��������
a = 0.5;%ѧϰ��
in = 784; %������Ԫ����,��Ϊ���ݼ���28*28=784�����أ���Ϊ784
hid = 30;%���ز���Ԫ����
out = 10; %�������Ԫ��������Ϊ�����0��9��10������

%��������ɵ�Ȩ����ƫ��
w = randn(out,hid);
b = randn(out,1);
w_h =randn(hid,in);
b_h = randn(hid,1);


for i=0:step
    %����ѵ������
    r=randperm(60000);
    x_train = x_train(:,r);
    y_train = y_train(:,r);

    for j=1:60000
        x = x_train(:,j);
        y = y_train(:,j);

        hid_put = layerout(w_h,b_h,x);
        out_put = layerout(w,b,hid_put);

        %���¹�ʽ��ʵ��
        o_update = (y-out_put).*out_put.*(1-out_put);
        h_update = ((w')*o_update).*hid_put.*(1-hid_put);

        outw_update = a*(o_update*(hid_put'));
        outb_update = a*o_update;
        hidw_update = a*(h_update*(x'));
        hidb_update = a*h_update;
        

        %����ѵ�����Ȩ��ƫ��
        w = w + outw_update;
        b = b+ outb_update;
        w_h = w_h +hidw_update;
        b_h =b_h +hidb_update;

        
    end
    fprintf('��ѵ��%d�ι�%d��\n',i,step);
end  

end 