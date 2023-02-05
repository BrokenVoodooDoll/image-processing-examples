function out_im = binarizer(in_im, v, h)

%This programs splits an image into 'v' blocks in vertical direction
% and into 'h' blocks in horizontal direction. All the bloacks are equal.

[x, y] = size(in_im); %size of the input image
out_im = []; %output image

for ii = 1:(v)
    temp = [];
    ranx = ((ii-1)*ceil(x/v)+1):(ii*ceil(x/v)); %horizontal range
    if ii == v
        ranx = (((ii-1)*ceil(x/v)+1):x);
    end
    for jj = 1:(h)
        rany = ((jj-1)*ceil(y/h)+1):(jj*ceil(y/h)); %horizontal range
        if jj == h
            rany = (((jj-1)*ceil(y/h)+1):y);
        end
        t = graythresh(in_im(ranx,rany));
        temp = cat(2,temp,imbinarize(in_im(ranx,rany),t));
    end
    out_im = cat(1,out_im,temp);
end

end