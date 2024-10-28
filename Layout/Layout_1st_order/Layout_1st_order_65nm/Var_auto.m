%try name auto var 
%just a test, no use
CCO_size_lib = ["CCO82", "CCO124", "CCO164", "CCO206", "CCO248"];
CCO_load_lib = ["DCAP0", "DCAP1", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];

R=[1 2 3;
    4 5 6;
    7 8 9];
for i=1:3
        eval(['T',num2str(i),'=','R(i,:)',';']);
end

for i = 1:5
    for j = 1:7
        freq_{CCO_size_lib(i)}_{CCO_load_lib(j)} = 
    end
end
