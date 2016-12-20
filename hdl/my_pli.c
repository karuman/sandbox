#include "acc_user.h"
#include "veriuser.h"
 
int to_float32() {
  union {
    float f;
    unsigned int u;
  } _uf;
 
  // initialize tasks
  acc_initialize();
  static s_setval_delay delay_s = {accRealTime, accNoDelay};
  static s_setval_value value_s = {accIntVal};
  delay_s.time.real = 0;
 
  handle reg = acc_handle_tfarg(1);  // get register handle
  float val = acc_fetch_tfarg(2);    // get floating number
  // set floating-point binary value
  _uf.f = val;
  value_s.value.integer = _uf.u;
 
  acc_set_value(reg,&value_s,&delay_s);
}
 
s_tfcell veriusertfs[] = {
  { usertask, 0, 0, 0, to_float32, 0, "$to_float32",1 },
  {0}
};
