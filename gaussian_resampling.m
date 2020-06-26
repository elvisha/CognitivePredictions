function [data_resampled] = gaussian_resampling(data)
%Resamples the data into a Gaussian distribution
%based on ideas presented in Honey, Sporns, et al, 2009

%given n raw data values and n random samples from a unit 
%Gaussian distribution: the smallest raw data value is replaced 
%with the smallest Gaussian distribution value, the second smallest 
%raw data value with the second smallest Gaussian distribution
%value, etc until all values have been replaced

%resamples on an individual basis 
%includes all zero values from the raw data values in the resampling 


%sort raw data into ascending order
[data_sort,idx]=sort(data,'ascend');

%generate gaussian distribution with mean of 0.5 and standard 
%deviation of 0.1 and sort into ascending order
gaussian=0.5+0.1*randn(size(data));
gaussian_sort=sort(gaussian,'ascend');

%resample data
data_resampled=nan(1,length(data));
for i=1:length(data_resampled)
    data_resampled(idx(i))=gaussian_sort(i);
end