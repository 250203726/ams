/***********************************************************************
 * Module:  资产类别表.java
 * Author:  simon
 * Purpose: Defines the Class 资产类别表
 ***********************************************************************/

import java.util.*;

/** @pdOid 9bfa0d33-985d-4f9b-838c-9305ad35a79a */
public class 资产类别表 {
   /** @pdOid 048ba05c-7a2d-416f-968d-5a1f5920a23a */
   public java.lang.String 资产类别编号;
   /** @pdOid ddb6bd6c-9477-4131-901a-75337cd7fa05 */
   public java.lang.String 资产类别名称;
   
   /** @pdRoleInfo migr=no name=资产名称表 assc=reference15 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<资产名称表> 资产名称表;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<资产名称表> get资产名称表() {
      if (资产名称表 == null)
         资产名称表 = new java.util.HashSet<资产名称表>();
      return 资产名称表;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIterator资产名称表() {
      if (资产名称表 == null)
         资产名称表 = new java.util.HashSet<资产名称表>();
      return 资产名称表.iterator();
   }
   
   /** @pdGenerated default setter
     * @param new资产名称表 */
   public void set资产名称表(java.util.Collection<资产名称表> new资产名称表) {
      removeAll资产名称表();
      for (java.util.Iterator iter = new资产名称表.iterator(); iter.hasNext();)
         add资产名称表((资产名称表)iter.next());
   }
   
   /** @pdGenerated default add
     * @param new资产名称表 */
   public void add资产名称表(资产名称表 new资产名称表) {
      if (new资产名称表 == null)
         return;
      if (this.资产名称表 == null)
         this.资产名称表 = new java.util.HashSet<资产名称表>();
      if (!this.资产名称表.contains(new资产名称表))
      {
         this.资产名称表.add(new资产名称表);
         new资产名称表.set资产类别表(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param old资产名称表 */
   public void remove资产名称表(资产名称表 old资产名称表) {
      if (old资产名称表 == null)
         return;
      if (this.资产名称表 != null)
         if (this.资产名称表.contains(old资产名称表))
         {
            this.资产名称表.remove(old资产名称表);
            old资产名称表.set资产类别表((资产类别表)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAll资产名称表() {
      if (资产名称表 != null)
      {
         资产名称表 old资产名称表;
         for (java.util.Iterator iter = getIterator资产名称表(); iter.hasNext();)
         {
            old资产名称表 = (资产名称表)iter.next();
            iter.remove();
            old资产名称表.set资产类别表((资产类别表)null);
         }
      }
   }

}