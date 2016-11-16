/***********************************************************************
 * Module:  供应商信息表.java
 * Author:  simon
 * Purpose: Defines the Class 供应商信息表
 ***********************************************************************/

import java.util.*;

/** @pdOid a2984f6d-14c5-4a89-ae2a-28b50404c4eb */
public class 供应商信息表 {
   /** @pdOid 19f06739-6188-4a6b-9f70-38721250a53a */
   public java.lang.String 供应商编号;
   /** @pdOid 0346bf7e-ac35-45d2-b698-e609b8a9dbc0 */
   public java.lang.String 供应商名称;
   /** @pdOid e803f780-4b66-4516-a3c0-3cbbd0236e1a */
   public java.lang.String 供应商联系人;
   /** @pdOid 02543323-e34f-4286-9161-b9bc62432dae */
   public int 供应商联系人电话;
   
   /** @pdRoleInfo migr=no name=资产信息表 assc=reference7 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
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
         new资产信息表.set供应商信息表(this);      
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
            old资产信息表.set供应商信息表((供应商信息表)null);
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
            old资产信息表.set供应商信息表((供应商信息表)null);
         }
      }
   }

}