function quicksort()
    clear
    numberOfValues = input('Number of values you would like to sort ');
    blue_values = rand(1,numberOfValues) * 255;
    red_values = 255 - blue_values;
    no_green = zeros(1,numberOfValues);
    
    %plotting before plot
    subplot(1,2,1);
    plot_lights(red_values, no_green, blue_values)
    xlabel('Before')
    
    %plotting after plot and sorting it
    tStart = tic;
    mat = quicksort_algo(blue_values);
    tEnd = toc(tStart);
    red_values = 255 - mat;
    
    pause(1);
    subplot(1,2,2);
    plot_lights(red_values, no_green, mat);
    xlabel("After! Sort Took: " + tEnd);
    %a checker to looks to see whether or not the matrix is actually sorted. If
    not, %YIKES
    for i = 1: (numel(mat) - 1)
        if(mat(i) >= mat(i+1))
            disp("YIKES");
            disp(mat)
        end
    end
end

function [sorted] = quicksort_algo(unsorted_values)
    if(numel(unsorted_values) == 1) %if the length of the unsorted_values array is one, return the array
        sorted = unsorted_values;
    elseif(numel(unsorted_values) ~= 0) %otherwise, the unsorted_values array should find a pivot, then split
        sizeOfArray = numel(unsorted_values);
        %pivot
        pivot = unsorted_values(sizeOfArray); %pivot is last element of the array
        %sort unsorted values
        min = 0; %location of the last value that was below the pivot
        for i = 1:numel(unsorted_values) %location of the element of what the pivot is compared to
            if(unsorted_values(i) < pivot)
                min = min + 1;
                place_holder = unsorted_values(min);
                unsorted_values(min) = unsorted_values(i);
                unsorted_values(i) = place_holder;
            end
        end
        place_holder = unsorted_values(min + 1); %pivot is now the value AFTER the
        value less than it
        unsorted_values(min+1) = pivot;
        unsorted_values(numel(unsorted_values)) = place_holder; %and the last value is now whatever swapped places with pivot
        if(min ~= 0) %if there was something less than the pivot
            sorted = [quicksort_algo(unsorted_values(1:min)),
            quicksort_algo(unsorted_values( (min+1):numel(unsorted_values) ))];
        else %otherwise, the pivot is the front of the array (from the swap), and
            the rest of the array needs to be sorted
            sorted = [quicksort_algo(unsorted_values(1)),
            quicksort_algo(unsorted_values(2:numel(unsorted_values))) ];
        end
    end
end