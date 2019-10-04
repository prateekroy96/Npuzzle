clc;
n = 3;
n2 = n*n;
%[1 2 3 4 5; 6 7 8 9 10; 11 12 13 14 15; 16 17 18 19 20; 21 22 23 24 25];
%puzzle_state = [9 4 6 8; 14 0 1 12; 2 11 13 5; 15 3 10 7];
%puzzle_solved = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 0];%correct state
puzzle_state = [4 0 8; 1 5 2; 6 3 7];
puzzle_solved = [1 2 3; 4 5 6; 7 8 0];
puzzle_size_check = size(puzzle_state);
if not(all(puzzle_size_check == [n n]))
    msgbox('Input is not in correct format.............. The format must be 3 x 3 matrix. The blank space should be replaced by 0.','8-Puzzle suresh Kumar Gadi');
else
    puzzle_current_states = [];
    puzzle_all_states = [];
    puzzle_sub_states = [];
    g = 0;
    [h1,h2,h3,h4] = a_star_cost(puzzle_state,puzzle_solved,n);
    h = weighted_sum(h1,h2,h3,h4);                                                          % h = h1 + h2
    f = h + g;                                                             % f = g + h
    puzzle_current_states = join(puzzle_current_states,puzzle_state,f,g,h,n);%[puzzle f g h]  n x 12 
    puzzle_all_states = join(puzzle_all_states,puzzle_state,f,g,h,n);        %[puzzle f g h ? ? S.no]  n x 15
    puzzle_all_states(:,n2+4)=0;
    puzzle_all_states(1,n2+5)=0;
    puzzle_all_states(1,n2+6)=1;
    flag_1 = 1; %flag
    loop_count = 0;
    parent = 1;
    serial = 1;
    while flag_1 == 1; %flag
        loop_count = loop_count + 1; %loop count
        [puzzle_output, f, g, h] =  Get(puzzle_current_states,1,n);
        [row_pos, col_pos] = find(puzzle_output==0);%posn of blank
        puzzle_current_states = [];% reset
        if h ~= 0 %if not solved already
% % % % % % left
            if col_pos > 1
                puzzle_new_state = puzzle_output;
                puzzle_new_state(row_pos,col_pos) = puzzle_output(row_pos,col_pos - 1);
                puzzle_new_state(row_pos,col_pos - 1) = 0;
                [h1,h2,h3,h4] = a_star_cost(puzzle_new_state,puzzle_solved,n);
                h = weighted_sum(h1,h2,h3,h4);
                g_new = g + 1;
                f = g_new + h;
                [puzzle_current_states] =  join(puzzle_current_states,puzzle_new_state,f,g_new,h,n);
            end
% % % % % % top
            if row_pos > 1
                puzzle_new_state = puzzle_output;
                puzzle_new_state(row_pos,col_pos) = puzzle_output(row_pos-1,col_pos);
                puzzle_new_state(row_pos-1,col_pos) = 0;
                [h1,h2,h3,h4] = a_star_cost(puzzle_new_state,puzzle_solved,n);
                h = weighted_sum(h1,h2,h3,h4);
                g_new = g + 1;
                f = g_new + h;
                [puzzle_current_states] = join(puzzle_current_states,puzzle_new_state,f,g_new,h,n);                
            end
% % % % % % right
            if col_pos < n
                puzzle_new_state = puzzle_output;
                puzzle_new_state(row_pos,col_pos) = puzzle_output(row_pos,col_pos + 1);
                puzzle_new_state(row_pos,col_pos + 1) = 0;
                [h1,h2,h3,h4] = a_star_cost(puzzle_new_state,puzzle_solved,n);
                h = weighted_sum(h1,h2,h3,h4);
                g_new = g + 1;
                f = g_new + h;
                [puzzle_current_states] = join(puzzle_current_states,puzzle_new_state,f,g_new,h,n);                
            end
% % % % % % down
            if row_pos < n
                puzzle_new_state = puzzle_output;
                puzzle_new_state(row_pos,col_pos) = puzzle_output(row_pos + 1,col_pos);
                puzzle_new_state(row_pos + 1,col_pos) = 0;
                [h1,h2,h3,h4] = a_star_cost(puzzle_new_state,puzzle_solved,n);
                h = weighted_sum(h1,h2,h3,h4);
                g_new = g + 1;
                f = g_new + h;
                [puzzle_current_states] = join(puzzle_current_states,puzzle_new_state,f,g_new,h,n);                
            end
% % % % % % compare with history
            [row_count, temp] = size(puzzle_current_states);
            for i = 1 : row_count
                val = search(puzzle_all_states,puzzle_current_states(i,:),n);
                if ~isempty(val)
%                     
                else
                    [col_len , temp] = size(puzzle_all_states);
                    intv008 = puzzle_current_states(i,1:n2+3);
                    intv008(n2+4) = 0;
                    intv008(n2+5) = parent;
                    serial = serial + 1;
                    intv008(n2+6) = serial;
                    puzzle_all_states(col_len + 1,:)=intv008;
                end
            end
% % % % % % selecting new node
            val = find(puzzle_all_states(:,n2+4) == 1);
            len = length(val);
            puzzle_sub_states = puzzle_all_states;
            for j = 1:len
                puzzle_sub_states(val(j)-(j-1),:)=[];
            end
            min_val = min(puzzle_sub_states,[],1);
            [puzzle_output, f, g, h] = Get(min_val,1,n);
            [row_pos, col_pos] = find((puzzle_sub_states(:,n2+1)==f) & (puzzle_sub_states(:,n2+4) == 0));
            [puzzle_output, f, g, h] = Get(puzzle_sub_states,row_pos(1,1),n);
            parent = puzzle_sub_states(row_pos(1,1),n2+6);
            puzzle_current_states = [];
            [puzzle_current_states] = join(puzzle_current_states,puzzle_output,f,g,h,n);
            val = search(puzzle_all_states,puzzle_current_states,n);
            puzzle_all_states(val,n2+4) = 1;
            flag_1 = 1;
        else
            flag_1 = 2;
        end
    end
    % % Display of steps
    [row_cnt, temp] = size(puzzle_all_states);
    flag_2 = 1;
    puzzle_step = [];
    step_count = 0;
    while flag_2 ==1
        step_count = step_count + 1;
        puzzle_step(step_count) = row_cnt;
        row_cnt = puzzle_all_states(row_cnt,n2+5);
        if row_cnt == 0
            flag_2 = 2;
        else
            flag_2 = 1;
        end
    end
    for k = 1 : step_count
        [puzzle_out, f, g, h] =  Get(puzzle_all_states,puzzle_step(step_count-k+1),n);
        Step = k-1
        puzzle_out
    end
    
end
X = size(puzzle_all_states);
Nodes = X(1,1)
