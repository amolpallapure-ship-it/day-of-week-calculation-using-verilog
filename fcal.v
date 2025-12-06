module day_of_week(
    input  [4:0]  day,      // 1-31
    input  [3:0]  month,    // 1-12
    input  [12:0] year,     // 1-9999
    output reg [2:0] dow,   // 0=Sun ... 6=Sat
    output reg [31:0] total_days
);

    integer i;
    integer month_days[1:12];

    always @(*) begin
        // Initialize month lengths
        month_days[1]  = 31;
        month_days[2]  = 28;
        month_days[3]  = 31;
        month_days[4]  = 30;
        month_days[5]  = 31;
        month_days[6]  = 30;
        month_days[7]  = 31;
        month_days[8]  = 31;
        month_days[9]  = 30;
        month_days[10] = 31;
        month_days[11] = 30;
        month_days[12] = 31;

        total_days = 0;

        // Add full years
        for (i = 1; i < year; i = i + 1) begin
            if ((i % 400 == 0) || (i % 4 == 0 && i % 100 != 0))
                total_days = total_days + 366;
            else
                total_days = total_days + 365;
        end

        // Add full months of current year
        for (i = 1; i < month; i = i + 1) begin
            total_days = total_days + month_days[i];
            if (i == 2 && ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)))
                total_days = total_days + 1; // leap day
        end

        // Add days of current month
        total_days = total_days + day;

        // Compute day of week
        dow = total_days % 7;  
    end

endmodule
