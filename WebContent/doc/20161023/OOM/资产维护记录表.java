/***********************************************************************
 * Module:  资产维护记录表.java
 * Author:  simon
 * Purpose: Defines the Class 资产维护记录表
 ***********************************************************************/

import java.util.*;

/** @pdOid 9606c196-5e23-4e9b-b8d8-95d256551e80 */
public class 资产维护记录表 {
   /** @pdOid 228b7668-277f-49ea-ba8f-86d64af187ef */
   public java.lang.String 维护记录编号;
   /** @pdOid 93bb2b05-9232-42f8-a4d0-5d69bc7689c1 */
   public java.lang.String 检修成员;
   /** @pdOid de03071c-5000-4092-a1cb-ba6c5052b7ce */
   public varcahr(200) 检修性质;
   /** @pdOid f7ce7ee1-2ed4-4f66-835c-0d4b99e708ab */
   public java.util.Date 检修日期;
   /** @pdOid dca5e951-e976-4202-af63-b6f1f66835f7 */
   public java.lang.String 检修前状态;
   /** @pdOid 3ba08236-c3a6-4b43-bdfa-644a4f1ed1bc */
   public java.lang.String 检修内容;
   /** @pdOid b9d63d29-4c26-4b91-a484-434a27e244f2 */
   public java.lang.String 检修后状态;
   /** @pdOid c5cfd370-151a-4266-98a2-608dc33bb6c0 */
   public java.lang.String 验收人;
   /** @pdOid 1cf40668-1e39-45f2-a146-0957b0595cab */
   public java.util.Date 记录时间;
   /** @pdOid 1b4948d6-5514-433f-aef7-c030c402ce60 */
   public varcahr(200) 验收评价;
   
   /** @pdRoleInfo migr=no name=资产信息表 assc=reference13 mult=0..1 side=A */
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
            old资产信息表.remove资产维护记录表(this);
         }
         if (new资产信息表 != null)
         {
            this.资产信息表 = new资产信息表;
            this.资产信息表.add资产维护记录表(this);
         }
      }
   }

}