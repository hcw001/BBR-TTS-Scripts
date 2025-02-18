function get_count_list(lst, target)
    --Count Instances of <target> in <lst>
    local count = 0
    for index, value in ipairs(lst) do
        if value == target then
            count = count + 1
        end
    end
    return count
end