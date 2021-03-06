function [] = random_walk(is, p, iter)
if is < 1
    fprintf('s_0 should be a positive integer.\n');
    exit;
end
MAX_WALK = 1000000;
prob = p;   % probability of [increase] state
current_s = is;    % record the current state, which is initial state
count = 0;
for n = 1:iter
    time = 0;
    while 1
        if time > MAX_WALK
            break;
        end
        odd = rand();
        if odd <= prob
            current_s = current_s + 1;
        else
            if current_s > 1
                current_s = current_s - 1;
            end
        end
        if current_s == is
            count = count + 1;
            break
        end
        time = time + 1;
    end
end
fprintf('probability of return to state %d is %f.\n', is, count/iter);
end        