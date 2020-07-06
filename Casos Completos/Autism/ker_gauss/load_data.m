% cse all;
% clc;
% clear;
warning('off','all');
rng(seed);
set_datos='Toddler Autism';
name_data=sprintf('../datos/%s/%s',set_datos,set_datos);
load_name=[name_data,'.csv'];
T=readtable(load_name);

l=length(T.Class_ASDTraits);

positive=0;
for ii=1:l
    switch T.Class_ASDTraits{ii}
        case 'Yes'
            T.Class_ASDTraits{ii}=1;
            positive=positive+1;
        otherwise
            T.Class_ASDTraits{ii}=-1;
    end
end
% fprintf('ASD Traits:\t%f\n',positive/l);

positive=0;
for ii=1:l
    switch T.Jaundice{ii}
        case 'yes'
            T.Jaundice{ii}=1;
            positive=positive+1;
        otherwise
            T.Jaundice{ii}=-1;
    end
end
% fprintf('Jaundice:\t%f\n',positive/l);

positive=0;
for ii=1:l
    switch T.Family_mem_with_ASD{ii}
        case 'yes'
            T.Family_mem_with_ASD{ii}=1;
            positive=positive+1;
        otherwise
            T.Family_mem_with_ASD{ii}=-1;
    end
end
% fprintf('Family history:\t%f\n',positive/l);

positive=0;
for ii=1:l
    switch T.Sex{ii}
        case 'f'
            T.Sex{ii}=1;
            positive=positive+1;
        otherwise
            T.Sex{ii}=-1;
    end
end
% fprintf('F sex:\t\t%f\n',positive/l);
clear positive;

case_fam=0;
case_HC=0;
case_Self=0;
case_others=0;
for ii=1:l
    switch T.WhoCompletedTheTest{ii}
        case 'Health Care Professional'
            T.WhoCompletedTheTest{ii}=1;
            case_HC=case_HC+1;
        case 'family member'
            T.WhoCompletedTheTest{ii}=2;
            case_fam=case_fam+1;
        case 'Self'
            T.WhoCompletedTheTest{ii}=3;
            case_Self=case_Self+1;
        otherwise
            T.WhoCompletedTheTest{ii}=-1;
            case_others=case_others+1;
    end
end
% fprintf('Completed  by:\n');
% fprintf('\tFamily:\t%f\n',case_fam/l);
% fprintf('\tHC:\t%f\n',case_HC/l);
% fprintf('\tSelf:\t%f\n',case_Self/l);
% fprintf('\tOthers:\t%f\n',case_others/l);

case_middle_eastern=0;
case_White_European=0;
case_Hispanic=0;
case_black=0;
case_asian=0;
case_south_asian=0;
case_Native_Indian=0;
case_Latino=0;
case_mixed=0;
case_Pacifica=0;
case_otherwise=0;
for ii=1:l
    switch T.Ethnicity{ii}
        case 'middle eastern'
			case_middle_eastern=case_middle_eastern+1;
            T.Ethnicity{ii}=0;
        case 'White European'
            case_White_European=case_White_European+1;
            T.Ethnicity{ii}=1;
        case 'Hispanic'
			case_Hispanic=case_Hispanic+1;
            T.Ethnicity{ii}=2;
        case 'black'
			case_black=case_black+1;
            T.Ethnicity{ii}=3;
        case 'asian'
			case_asian=case_asian+1;
            T.Ethnicity{ii}=4;
        case 'south asian'
			case_south_asian=case_south_asian+1;
            T.Ethnicity{ii}=5;
        case 'Native Indian'
			case_Native_Indian=case_Native_Indian+1;
            T.Ethnicity{ii}=6;
        case 'Latino'
			case_Latino=case_Latino+1;
            T.Ethnicity{ii}=7;
        case 'mixed'
			case_mixed=case_mixed+1;
            T.Ethnicity{ii}=8;
        case 'Pacifica'
			case_Pacifica=case_Pacifica+1;
            T.Ethnicity{ii}=9;
        otherwise
            case_otherwise=case_otherwise+1;
            T.Ethnicity{ii}=11;
    end
end
% fprintf('Ethnicity:\n');
% fprintf('\tMiddle Eastern:\t%f\n',case_middle_eastern/l);
% fprintf('\tWhite European:\t%f\n',case_White_European/l);
% fprintf('\tHispanic:\t%f\n',case_Hispanic/l);
% fprintf('\tBlack:\t\t%f\n',case_black/l);
% fprintf('\tAsian:\t\t%f\n',case_asian/l);
% fprintf('\tSouth Asian:\t%f\n',case_south_asian/l);
% fprintf('\tNative Indian:\t%f\n',case_Native_Indian/l);
% fprintf('\tLatino:\t\t%f\n',case_Latino/l);
% fprintf('\tMixed:\t\t%f\n',case_mixed/l);
% fprintf('\tPacifica:\t%f\n',case_Pacifica/l);
% fprintf('\tOtherwise:\t%f\n',case_otherwise/l);
clear case* ii l
complete_data=table2cell(T);
clear T;
complete_data=cell2mat(complete_data);

perm1=randperm(length(complete_data),300);

boot_data=complete_data;
boot_data(perm1,:)=[];

total_data=complete_data(perm1,:);

data_size=size(total_data,1);

if(all(total_data(:,1)==(1:data_size)'))
    total_data=total_data(:,(2:end));
end

dimensions=size(total_data,2)-1;

train_data_size=round(data_size*(20/100));

data_validation=total_data;
perm=randperm(data_size,train_data_size);
data_validation(perm,:)=[];
train_data=total_data(perm,:);