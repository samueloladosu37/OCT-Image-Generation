function [B_sc_scale] = sc_process(B_sc_in, sc_table)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

a_scan_N = size(B_sc_in, 2);

a_sample_N = size(sc_table, 1);

B_sc_scale = zeros(a_sample_N, a_scan_N);

for i = 1 : a_scan_N
    for j = 1 : a_sample_N
        B_sc_scale(j,i) = B_sc_in(sc_table(j)+1, i);
    end
end
end