`timescale 1ns/1ps

module tb_day_of_week;

    reg  [4:0]  day;
    reg  [3:0]  month;
    reg  [12:0] year;
    wire [2:0]  dow;
    wire [31:0] total_days;

    // Instantiate main module
    day_of_week dut(
        .day(day),
        .month(month),
        .year(year),
        .dow(dow),
        .total_days(total_days)
    );

    initial begin
        // Test date: 05-12-1919
        day   = 2;
        month = 3;
        year  = 1890;

        #10; // wait for calculation

        $display("=======================================");
        $display("     DATE ENTERED: %0d-%0d-%0d", day, month, year);
        $display("     TOTAL DAYS  : %0d", total_days);

        case (dow)
            0: $display("     DAY OF WEEK : SUNDAY");
            1: $display("     DAY OF WEEK : MONDAY");
            2: $display("     DAY OF WEEK : TUESDAY");
            3: $display("     DAY OF WEEK : WEDNESDAY");
            4: $display("     DAY OF WEEK : THURSDAY");
            5: $display("     DAY OF WEEK : FRIDAY");
            6: $display("     DAY OF WEEK : SATURDAY");
        endcase
        $display("=======================================");

        $finish;
    end
endmodule
