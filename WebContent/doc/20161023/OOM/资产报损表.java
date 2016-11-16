/***********************************************************************
 * Module:  资产报损表.java
 * Author:  simon
 * Purpose: Defines the Class 资产报损表
 ***********************************************************************/

import java.util.*;

/** @pdOid 57663f0e-22d7-4f6d-8c81-1e6d5e98574f */
public class 资产报损表 {
   /** @pdOid 1d605269-4778-4e48-8dbb-6b23938344cb */
   public java.lang.String 资产报损编号;
   /** @pdOid 71cb5ffc-1cf6-4b6b-8bf7-e8460d27948a */
   public java.lang.String 损坏原因;
   /** @pdOid 31367161-c7b6-4236-b3ea-f01ce7c3ed29 */
   public java.lang.String 报损理由;
   /** @pdOid e80b1706-f06e-4e3c-b321-b02e2d2425e8 */
   public java.lang.String 鉴定意见;
   /** @pdOid 2e52f69c-5d1d-428f-bc08-d4cf62c5e6fe */
   public int 鉴定人编号;
   /** @pdOid 3f6f8d74-a29d-4c58-8c90-14b5b8ffb2b2 */
   public java.util.Date 鉴定时间;
   /** @pdOid 64433fa7-b569-4c1e-a96c-afeb4719a08e */
   public java.lang.String 审批意见;
   
   /** @pdRoleInfo migr=no name=资产信息表 assc=reference12 mult=0..1 side=A */
   public 资产信息表 资产信息表;
   
   
   /** @pdGenerated default parent getter */
   public 资产信息表 get资产信息表() {
      return 资产信息表;
   }
   
   /** @pdGenerated default parent setter
     * @param new资产信息表 */
   public void set资产信息表(资产信息表 new资产信息表) {
      if (this.资产信息表 == null || !this.资产信息表.equals(new资产信息表))
      {
         if (this.资产信息表 != null)
         {
            资产信息表 old资产信息表 = this.资产信息表;
            this.资产信息表 = null;
            old资产信息表.remove资产报损表(this);
         }
         if (new资产信息表 != null)
         {
            this.资产信息表 = new资产信息表;
            this.资产信息表.add资产报损表(this);
         }
      }
   }

}