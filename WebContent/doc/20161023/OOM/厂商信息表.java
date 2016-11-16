/***********************************************************************
 * Module:  厂商信息表.java
 * Author:  simon
 * Purpose: Defines the Class 厂商信息表
 ***********************************************************************/

import java.util.*;

/** @pdOid f34a05c5-a942-4801-9d20-b779de1d5740 */
public class 厂商信息表 {
   /** @pdOid 5f98b2e3-1a01-4c26-b7af-7d0ba54f2874 */
   public java.lang.String 厂商编号;
   /** @pdOid 85844882-83d0-4820-81bb-c787967dc7f3 */
   public java.lang.String 厂商名称;
   /** @pdOid 4715e521-112f-4730-9e39-6bf85d2c1e28 */
   public java.lang.String 厂商联系人;
   /** @pdOid eecb7733-440c-4c94-9c4f-fb2bec6004f6 */
   public int 厂商联系人电话;
   
   /** @pdRoleInfo migr=no name=资产信息表 assc=reference6 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<资产信息表> 资产信息表;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<资产信息表> get资产信息表() {
      if (资产信息表 == null)
         资产信息表 = new java.util.HashSet<资产信息表>();
      return 资产信息表;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIterator资产信息表() {
      if (资产信息表 == null)
         资产信息表 = new java.util.HashSet<资产信息表>();
      return 资产信息表.iterator();
   }
   
   /** @pdGenerated default setter
     * @param new资产信息表 */
   public void set资产信息表(java.util.Collection<资产信息表> new资产信息表) {
      removeAll资产信息表();
      for (java.util.Iterator iter = new资产信息表.iterator(); iter.hasNext();)
         add资产信息表((资产信息表)iter.next());
   }
   
   /** @pdGenerated default add
     * @param new资产信息表 */
   public void add资产信息表(资产信息表 new资产信息表) {
      if (new资产信息表 == null)
         return;
      if (this.资产信息表 == null)
         this.资产信息表 = new java.util.HashSet<资产信息表>();
      if (!this.资产信息表.contains(new资产信息表))
      {
         this.资产信息表.add(new资产信息表);
         new资产信息表.set厂商信息表(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param old资产信息表 */
   public void remove资产信息表(资产信息表 old资产信息表) {
      if (old资产信息表 == null)
         return;
      if (this.资产信息表 != null)
         if (this.资产信息表.contains(old资产信息表))
         {
            this.资产信息表.remove(old资产信息表);
            old资产信息表.set厂商信息表((厂商信息表)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAll资产信息表() {
      if (资产信息表 != null)
      {
         资产信息表 old资产信息表;
         for (java.util.Iterator iter = getIterator资产信息表(); iter.hasNext();)
         {
            old资产信息表 = (资产信息表)iter.next();
            iter.remove();
            old资产信息表.set厂商信息表((厂商信息表)null);
         }
      }
   }

}