/***********************************************************************
 * Module:  资产购置申请.java
 * Author:  simon
 * Purpose: Defines the Class 资产购置申请
 ***********************************************************************/

import java.util.*;

/** @pdOid bbe804e2-0e9f-43e6-b26a-7f7d5a3db71d */
public class 资产购置申请 {
   /** @pdOid ccd7c8c4-e05c-4c98-9398-6aff308b34bc */
   public java.lang.String 申请编号;
   /** @pdOid a00faa1f-e8dc-4819-bd67-7c39f010389a */
   public java.lang.String 请购部门;
   /** @pdOid 92836770-e34b-4d06-ae79-971a3a4dd9d1 */
   public java.lang.String 申请人编号;
   /** @pdOid 27e5f894-b0e9-4810-bdce-33407b851757 */
   public java.util.Date 申请时间;
   /** @pdOid 84d7c4bc-12aa-42f1-bf48-22791c8dd35e */
   public java.lang.String 规格型号;
   /** @pdOid 8dd22d12-b66d-42ff-8c2a-85368a097f37 */
   public int 申购数量;
   /** @pdOid d078f3db-146b-4cba-9cfa-411498cc5c1a */
   public float 预算资金;
   /** @pdOid 56fdecc6-9a70-4acb-b606-dbf76623690d */
   public java.lang.String 请购理由及用途;
   /** @pdOid 0d8edb73-8d53-4472-962d-041c087d0bea */
   public java.lang.String 备注;
   /** @pdOid 8e1aa433-af76-478b-abb4-a65f25d40259 */
   public java.lang.String 审批意见;
   /** @pdOid 8c1719a4-f312-4fab-8f45-0269fdcc44f0 */
   public java.lang.String 审批人;
   
   /** @pdRoleInfo migr=no name=用户表 assc=reference11 mult=0..1 side=A */
   public 用户表 用户表;
   /** @pdRoleInfo migr=no name=资产名称表 assc=reference14 mult=0..1 side=A */
   public 资产名称表 资产名称表;
   
   
   /** @pdGenerated default parent getter */
   public 用户表 get用户表() {
      return 用户表;
   }
   
   /** @pdGenerated default parent setter
     * @param new用户表 */
   public void set用户表(用户表 new用户表) {
      if (this.用户表 == null || !this.用户表.equals(new用户表))
      {
         if (this.用户表 != null)
         {
            用户表 old用户表 = this.用户表;
            this.用户表 = null;
            old用户表.remove资产购置申请(this);
         }
         if (new用户表 != null)
         {
            this.用户表 = new用户表;
            this.用户表.add资产购置申请(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public 资产名称表 get资产名称表() {
      return 资产名称表;
   }
   
   /** @pdGenerated default parent setter
     * @param new资产名称表 */
   public void set资产名称表(资产名称表 new资产名称表) {
      if (this.资产名称表 == null || !this.资产名称表.equals(new资产名称表))
      {
         if (this.资产名称表 != null)
         {
            资产名称表 old资产名称表 = this.资产名称表;
            this.资产名称表 = null;
            old资产名称表.remove资产购置申请(this);
         }
         if (new资产名称表 != null)
         {
            this.资产名称表 = new资产名称表;
            this.资产名称表.add资产购置申请(this);
         }
      }
   }

}