// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

scalar dummyScalar;
scalar fScalarIsForced=0;
scalar fScalarIsReleased=0;
scalar fScalarHasChanged=0;
scalar fForceFromNonRoot=0;
scalar fNettypeIsForced=0;
scalar fNettypeIsReleased=0;
void  hsG_0 (struct dummyq_struct * I1093, EBLK  * I1094, U  I651);
void  hsG_0 (struct dummyq_struct * I1093, EBLK  * I1094, U  I651)
{
    U  I1337;
    U  I1338;
    U  I1339;
    struct futq * I1340;
    I1337 = ((U )vcs_clocks) + I651;
    I1339 = I1337 & ((1 << fHashTableSize) - 1);
    I1094->I697 = (EBLK  *)(-1);
    I1094->I701 = I1337;
    if (I1337 < (U )vcs_clocks) {
        I1338 = ((U  *)&vcs_clocks)[1];
        sched_millenium(I1093, I1094, I1338 + 1, I1337);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I651 == 1)) {
        I1094->I702 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I697 = I1094;
        peblkFutQ1Tail = I1094;
    }
    else if ((I1340 = I1093->I1053[I1339].I714)) {
        I1094->I702 = (struct eblk *)I1340->I713;
        I1340->I713->I697 = (RP )I1094;
        I1340->I713 = (RmaEblk  *)I1094;
    }
    else {
        sched_hsopt(I1093, I1094, I1337);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
