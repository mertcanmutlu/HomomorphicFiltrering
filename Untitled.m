a=imread('Resim1.jpg');
im=im2double(a);
lowFR=0.18;
fftlogim = fft2(log(im+lowFR));
f=butter_hp_kernel(a,15,1);
c=fftlogim.*f;
h=real(ifft2(c));
h1=exp(h);

sld = uicontrol('Style', 'slider',...
        'Min',0,'Max',1,'Value',0.18,...
        'Position', [400 20 120 20],...
        'Callback', @surfzlim);
subplot(1,3,1);imshow(a);title('Original image');
subplot(1,3,2);imshow(h);title('h');
subplot(1,3,3);imshow(h1);title('h1');
 function surfzlim(source,~)
        a=imread('Resim1.jpg');
        im=im2double(a);
        lowFR=get(source,'Value');
        outtext = {'lowFR = ',num2str(lowFR)};
        text = uicontrol('Style','Text','Position',[400 50 120 35]);
        set(text,'String',outtext);
        fftlogim = fft2(log(im+lowFR));
        f=butter_hp_kernel(a,15,1);
        c=fftlogim.*f;
        h=real(ifft2(c));
        h1=exp(h);
        subplot(1,3,2);imshow(h);title('h');
        subplot(1,3,3);imshow(h1);title('h1');
    end