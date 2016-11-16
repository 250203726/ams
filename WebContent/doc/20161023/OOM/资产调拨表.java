/***********************************************************************
 * Module:  资产调拨表.java
 * Author:  simon
 * Purpose: Defines the Class 资产调拨表
 ***********************************************************************/

import java.util.*;

/** @pdOid 3ae6cce0-fa8c-4be2-afc2-3d413feea58e */
public class 资产调拨表 {
   /** @pdOid 9c3fcfd6-2c75-45e8-bbf6-e4820e127e97 */
   public java.lang.String 资产调拨编号;
   /** @pdOid 362cd7e9-8dee-4c86-8b86-0368289c9b1e */
   public java.lang.String 原使用部门;
   /** @pdOid b9620a3f-4be7-449a-87f4-f32752c7ee87 */
   public java.lang.String 原负责人;
   /** @pdOid 5f5ab772-4669-4cb0-939c-4096d6052fdb */
   public java.lang.String 现使用人;
   /** @pdOid 4527e518-e886-45ad-8162-02f1a25b43b7 */
   public java.lang.String 现负责人;
   /** @pdOid a87fecb2-b395-41a6-9158-5797f20a4a93 */
   public java.util.Date 调拨时间;
   /** @pdOid 5814355e-6d40-4d34-b804-51b8c9f75ed4 */
   public java.lang.String 资产状态;
   /** @pdOid 96662af6-962d-40ab-a234-5cd08a0e3e10 */
   public java.lang.String 资产附件;
   /** @pdOid 1e048ea7-7def-44f3-968a-4f4a679fd489 */
   public java.lang.String 备注;
   
   /** @pdRoleInfo migr=no name=资产信息表 assc=reference10 mult=0..1 side=A */
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
            old资产信息表.remove资产调拨表(this);
         }
         if (new资产信息表 != null)
         {
            this.资产信息表 = new资产信息表;
            this.资产信息表.add资产调拨表(this);
         }
      }
   }

}