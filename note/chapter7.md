##chapter7 行为级建模##

与C语言不同，verilog在本质上是并发而非顺序的，verilog 中的各个执行流程并发执行。每个initial语句与always语句代表一个独立的执行过程，同时从时间0开始执行。


###initial 语句###

所有在initial 语句内的语句构成一个initial块。initial块从仿真时刻0开始执行，在整个仿真过程中只执行一次。

如果一个模块中包含了若干个initial块，则这些initial块从时刻0开始并发执行，每个块的执行各自独立。
如果块内包含多条行为语句，那么需要把这些语句组成一组，一般是使用关键字begin和end将它们组成一个块语句。

initial块内的语句是按照顺序执行的。

###过程赋值语句###
过程赋值语句的更新对象是寄存器、整数、实数或时间变量。这些类型的变量在被赋值后，其值将保持不变，直到被其他过程赋值语句赋予新值。

####阻塞赋值语句（“=”）#####
串行块语句中的阻塞赋值语句按照循序执行。

例中，x=0到reg_b=reg_a之间的语句在0时刻执行；
语句reg_a[2]=0在时刻15开始执行。

eg.

initial

begin

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;x=0;y=1;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reg_b=reg_a;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#15 reg_a[2]=1'b1;

end


####非阻塞赋值语句（“<=”）#####
非阻塞语句在同一块内并发执行。
例中，x=0到reg_b=reg_a之间的语句在0时刻执行；
语句reg_a[2]=0在上述语句执行完后开始执行。

reg_b[15:13]<=#10 {x,y,z}在时刻10开始执行。

count<=count+1在时刻0开始被调度开始执行。

eg.

initial

begin

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;x=0;y=1;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reg_b=reg_a;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#15 reg_a[2]<=1'b1;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reg_b[15:13]<=#10 {x,y,z};

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;count<=count+1;

end

###基于事件的时序控制###

####命名事件控制####

Verilog语言提供了命名事件控制机制。用户可以在程序中声明event(事件)类型的变量，触发该变量，并且识别该变量是否已经发生。命名事件由关键字event声明，它不能保存任何值。事件的触发用符号->表示；判断事件是否发生使用符号@来识别。

####并行块####
并行块由关键字fork和join声明，具有以下特性：

1. 并行块内的语句并发执行；
2. 语句执行的顺序由各自语句中的延迟或事件控制决定；
3. 语句中的延迟或事件控制是相对于块语句开始执行的时刻而言的。

eg.交通灯控制案例
1.由于主干道来往的车辆很多，在默认情况下主干道的绿灯亮；
2.乡村公路间断性的有车经过，有车来时乡村公路的交通灯必须为绿灯，只需维持一段足够长的时间，以便通过。
3.只要乡村公路不再有车辆，那么乡村公路上的绿灯立马变为黄灯，然后变为红灯；同时，主干道的绿灯亮。
4.一个传感器用于监视乡村公路上是否有车等待，它向控制器输入信号X；如果X=1，则表示有车等待，否则X=0；
RTL and testbench codeLink:[Transport HDL Code](https://github.com/chenpup/HDL/blob/master/RTL/Transport_LED/)

变量说明：
parameter RED = 2'd0, YELLOW = 2'd1, GREEN=2'd2;
MAIN_SIG,CNTRY_SIG 为干道和乡村公路上信号灯输出

Simulation waveform and monitor result:

![monitor](https://github.com/chenpup/HDL/blob/master/picture/transport_monitor.png)
![transport](https://github.com/chenpup/HDL/blob/master/picture/transport_waveform.png)










