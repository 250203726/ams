/***********************************************************************
 * Module:  维护公司信息表.java
 * Author:  simon
 * Purpose: Defines the Class 维护公司信息表
 ***********************************************************************/

import java.util.*;

/** @pdOid a1ff204f-496b-4695-bd07-687241fe68d5 */
public class 维护公司信息表 {
   /** @pdOid 0b536427-9fb5-4e1f-95a2-ee40fcf22e0d */
   public java.lang.String 维护公司编号;
   /** @pdOid d3371519-238a-47cf-bca4-f16443dd846e */
   public java.lang.String 维护公司名称;
   /** @pdOid 3e434648-bcdd-46f6-8f8c-bdf3cd627ed5 */
   public java.lang.String 维护公司联系人;
   /** @pdOid 0a3a1f57-9070-49ec-ba84-147ebc61248a */
   public int 维护公司联系人电话;
   
   /** @pdRoleInfo migr=no name=资产信息表 assc=reference9 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
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
         new资产信息表.set维护公司信息表(this);      
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
            old资产信息表.set维护公司信息表((维护公司信息表)null);
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
            old资产信息表.set维护公司信息表((维护公司信息表)null);
         }
      }
   }

}