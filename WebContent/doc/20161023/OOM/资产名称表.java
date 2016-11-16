/***********************************************************************
 * Module:  资产名称表.java
 * Author:  simon
 * Purpose: Defines the Class 资产名称表
 ***********************************************************************/

import java.util.*;

/** @pdOid 5f493f2a-e539-4ec0-a1e6-4d3698405502 */
public class 资产名称表 {
   /** @pdOid 2fe67705-7981-4ddd-b644-ac1562fcb11e */
   public java.lang.String 资产名称编号;
   /** @pdOid 221d65d5-0bcf-458e-b4cd-0b45e07ca4b9 */
   public java.lang.String 资产名称;
   
   /** @pdRoleInfo migr=no name=资产信息表 assc=reference3 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<资产信息表> 资产信息表;
   /** @pdRoleInfo migr=no name=资产购置申请 assc=reference14 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<资产购置申请> 资产购置申请;
   /** @pdRoleInfo migr=no name=资产类别表 assc=reference15 mult=0..1 side=A */
   public 资产类别表 资产类别表;
   
   
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
         new资产信息表.set资产名称表(this);      
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
            old资产信息表.set资产名称表((资产名称表)null);
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
            old资产信息表.set资产名称表((资产名称表)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<资产购置申请> get资产购置申请() {
      if (资产购置申请 == null)
         资产购置申请 = new java.util.HashSet<资产购置申请>();
      return 资产购置申请;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIterator资产购置申请() {
      if (资产购置申请 == null)
         资产购置申请 = new java.util.HashSet<资产购置申请>();
      return 资产购置申请.iterator();
   }
   
   /** @pdGenerated default setter
     * @param new资产购置申请 */
   public void set资产购置申请(java.util.Collection<资产购置申请> new资产购置申请) {
      removeAll资产购置申请();
      for (java.util.Iterator iter = new资产购置申请.iterator(); iter.hasNext();)
         add资产购置申请((资产购置申请)iter.next());
   }
   
   /** @pdGenerated default add
     * @param new资产购置申请 */
   public void add资产购置申请(资产购置申请 new资产购置申请) {
      if (new资产购置申请 == null)
         return;
      if (this.资产购置申请 == null)
         this.资产购置申请 = new java.util.HashSet<资产购置申请>();
      if (!this.资产购置申请.contains(new资产购置申请))
      {
         this.资产购置申请.add(new资产购置申请);
         new资产购置申请.set资产名称表(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param old资产购置申请 */
   public void remove资产购置申请(资产购置申请 old资产购置申请) {
      if (old资产购置申请 == null)
         return;
      if (this.资产购置申请 != null)
         if (this.资产购置申请.contains(old资产购置申请))
         {
            this.资产购置申请.remove(old资产购置申请);
            old资产购置申请.set资产名称表((资产名称表)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAll资产购置申请() {
      if (资产购置申请 != null)
      {
         资产购置申请 old资产购置申请;
         for (java.util.Iterator iter = getIterator资产购置申请(); iter.hasNext();)
         {
            old资产购置申请 = (资产购置申请)iter.next();
            iter.remove();
            old资产购置申请.set资产名称表((资产名称表)null);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public 资产类别表 get资产类别表() {
      return 资产类别表;
   }
   
   /** @pdGenerated default parent setter
     * @param new资产类别表 */
   public void set资产类别表(资产类别表 new资产类别表) {
      if (this.资产类别表 == null || !this.资产类别表.equals(new资产类别表))
      {
         if (this.资产类别表 != null)
         {
            资产类别表 old资产类别表 = this.资产类别表;
            this.资产类别表 = null;
            old资产类别表.remove资产名称表(this);
         }
         if (new资产类别表 != null)
         {
            this.资产类别表 = new资产类别表;
            this.资产类别表.add资产名称表(this);
         }
      }
   }

}