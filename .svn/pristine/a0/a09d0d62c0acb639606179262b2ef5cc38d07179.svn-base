/***********************************************************************
 * Module:  部门表.java
 * Author:  simon
 * Purpose: Defines the Class 部门表
 ***********************************************************************/

import java.util.*;

/** 部门信息
 * 
 * @pdOid b3934c32-ab11-45fc-9407-806b240c6d08 */
public class 部门表 {
   /** @pdOid d4911ad8-ada3-41c0-a2f8-438eb1944fe6 */
   public java.lang.String 部门编号;
   /** @pdOid c7666490-6a49-4794-b325-ef50063fcf58 */
   public java.lang.String 部门名称;
   /** @pdOid 1432058d-cf62-4489-ad23-4c79da7f1e9a */
   public java.lang.String 部门地址;
   /** @pdOid 9ddfdc03-15d0-4425-8c36-b126753b740a */
   public java.lang.String 部门负责人;
   
   /** @pdRoleInfo migr=no name=用户表 assc=reference1 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<用户表> 用户表;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<用户表> get用户表() {
      if (用户表 == null)
         用户表 = new java.util.HashSet<用户表>();
      return 用户表;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIterator用户表() {
      if (用户表 == null)
         用户表 = new java.util.HashSet<用户表>();
      return 用户表.iterator();
   }
   
   /** @pdGenerated default setter
     * @param new用户表 */
   public void set用户表(java.util.Collection<用户表> new用户表) {
      removeAll用户表();
      for (java.util.Iterator iter = new用户表.iterator(); iter.hasNext();)
         add用户表((用户表)iter.next());
   }
   
   /** @pdGenerated default add
     * @param new用户表 */
   public void add用户表(用户表 new用户表) {
      if (new用户表 == null)
         return;
      if (this.用户表 == null)
         this.用户表 = new java.util.HashSet<用户表>();
      if (!this.用户表.contains(new用户表))
      {
         this.用户表.add(new用户表);
         new用户表.set部门表(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param old用户表 */
   public void remove用户表(用户表 old用户表) {
      if (old用户表 == null)
         return;
      if (this.用户表 != null)
         if (this.用户表.contains(old用户表))
         {
            this.用户表.remove(old用户表);
            old用户表.set部门表((部门表)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAll用户表() {
      if (用户表 != null)
      {
         用户表 old用户表;
         for (java.util.Iterator iter = getIterator用户表(); iter.hasNext();)
         {
            old用户表 = (用户表)iter.next();
            iter.remove();
            old用户表.set部门表((部门表)null);
         }
      }
   }

}