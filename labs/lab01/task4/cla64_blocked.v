// cla64_blocked.v
// A practical 64-bit adder: sixteen 4-bit CLA blocks (your cla4.v),
// chained by feeding block k's carry-out into block (k+1)'s carry-in --
// the same instantiate-and-chain pattern as Task 2's ripple adder, just
// using 4-bit CLA blocks instead of single full adders.
//
// TODO: instantiate 16 cla4 blocks, named block0..block15, e.g.:
//   cla4 block0 (.a(a[3:0]),    .b(b[3:0]),    .cin(cin),  .sum(sum[3:0]),    .cout(c[1]));
//   cla4 block1 (.a(a[7:4]),    .b(b[7:4]),    .cin(c[1]), .sum(sum[7:4]),    .cout(c[2]));
//   ...
//   cla4 block15(.a(a[63:60]),  .b(b[63:60]),  .cin(c[15]),.sum(sum[63:60]),  .cout(cout));

module cla64_blocked(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);

  wire [15:1] c;   // carries BETWEEN blocks: c[1]..c[15]

  // TODO: your sixteen cla4 instances go here.
  cla4 block0 (a[3:0],b[3:0], cin,sum[3:0],c[1]);
  cla4 block1 (a[7:4],b[7:4], c[1],sum[7:4],c[2]);
  cla4 block2 (a[11:8],b[11:8], c[2],sum[11:8],c[3]);
  cla4 block3 (a[15:12],b[15:12], c[3],sum[15:12],c[4]);
  cla4 block4 (a[19:16],b[19:16], c[4],sum[19:16],c[5]);
  cla4 block5 (a[23:20],b[23:20], c[5],sum[23:20],c[6]);
  cla4 block6 (a[27:24],b[27:24], c[6],sum[27:24],c[7]);
  cla4 block7 (a[31:28],b[31:28], c[7],sum[31:28],c[8]);
  cla4 block8 (a[35:32],b[35:32], c[8],sum[35:32],c[9]);
  cla4 block9 (a[39:36],b[39:36], c[9],sum[39:36],c[10]);
  cla4 block10 (a[43:40],b[43:40], c[10],sum[43:40],c[11]);
  cla4 block11 (a[47:44],b[47:44], c[11],sum[47:44],c[12]);
  cla4 block12 (a[51:48],b[51:48], c[12],sum[51:48],c[13]);
  cla4 block13 (a[55:52],b[55:52], c[13],sum[55:52],c[14]);
  cla4 block14 (a[59:56],b[59:56], c[14],sum[59:56],c[15]);
  cla4 block15 (a[63:60],b[63:60], c[15],sum[63:60],cout);

endmodule
