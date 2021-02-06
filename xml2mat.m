function label_struct = xml2mat(filename)
%   label_struct = XML2MAT(filename) converts the .xml file provided with 
%   the MIVIA Audio Events dataset to MATLAB structure.

    fileID = fopen(filename);

    event_count = 0;
    event_state = 0;

    while ~feof(fileID)
        curline = fgets(fileID);
        if contains(curline,'events')
            event_state = 1;
        end
        if contains(curline,'</events>')
            event_state = 0;
        end

        if event_state
            if contains(curline,'item') && ~contains(curline,'</item>')
                event_count = event_count + 1;
            end

            st1 = 'CLASS_ID';
            st2 = 'STARTSECOND';
            st3 = 'ENDSECOND';

            % If the line contains an event class or start/stop time,
            % analyze it to find the number we care about
            if contains(curline,st1) || contains(curline,st2) || contains(curline,st3)
                idx_begin = find(curline=='>');
                idx_begin = idx_begin(1);
                idx_end = find(curline=='<');
                idx_end = idx_end(2);
                substr = curline(idx_begin+1:idx_end-1);
            end

            % The number is the class ID
            if contains(curline,st1)
                cur_class = str2num(substr);
            end
            % The number is the start time of the event
            if contains(curline,st2)
                cur_startsecond = str2num(substr);
            end
            % The number is the stop time of the event
            if contains(curline,st3)
                cur_endsecond = str2num(substr);
            end

            % When the item is done, package it up!
            if contains(curline,'</item>')
                label_struct(event_count).class = cur_class;
                label_struct(event_count).startsecond = cur_startsecond;
                label_struct(event_count).endsecond = cur_endsecond;
            end
        end
    end

    fclose(fileID);

end