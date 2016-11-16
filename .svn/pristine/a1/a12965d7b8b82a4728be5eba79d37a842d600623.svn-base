/***********************************************************************
 * Module:  用户表.java
 * Author:  simon
 * Purpose: Defines the Class 用户表
 ***********************************************************************/

import java.util.*;

/** @pdOid 86fbea41-3314-4673-b744-100a480f7fb0 */
public class 用户表 {
   /** @pdOid e7dd1693-d05f-4c84-aa70-f8230031f125 */
   public java.lang.String 用户编号;
   /** @pdOid 837f7d0b-8fa8-4dd3-b786-cfd7ae42693c */
   public java.lang.String 用户名;
   /** @pdOid 8a4fb7c8-d371-4b79-b4dc-9b26a0e06d7d */
   public java.lang.String 密码;
   /** @pdOid 0832dd0c-fcc6-4fd6-a010-6ba28b3d4240 */
   public java.lang.String 真实姓名;
   /** @pdOid 16e7c0d2-3ca2-4444-a0a7-f8075ee804d1 */
   public java.lang.String 手机号;
   /** @pdOid 3b39c111-5839-481c-b31f-cdef21b88006 */
   public java.lang.String 用户类型;
   /** @pdOid 105d1056-6a4e-4923-9a20-08ec22a95640 */
   public java.lang.String 用户状态;
   
   /** @pdRoleInfo migr=no name=资产信息表 assc=reference4 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<资产信息表> 资产信息表;
   /** @pdRoleInfo migr=no name=资产购置申请 assc=reference11 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<资产购置申请> 资产购置申请;
   /** @pdRoleInfo migr=no name=部门表 assc=reference1 mult=0..1 side=A */
   public 部门表 部门表;
   
   
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
         new资产信息表.set用户表(this);      
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
            old资产信息表.set用户表((用户表)null);
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
            old资产信息表.set用户表((用户表)null);
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
         new资产购置申请.set用户表(this);      
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
            old资产购置申请.set用户表((用户表)null);
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
            old资产购置申请.set用户表((用户表)null);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public 部门表 get部门表() {
      return 部门表;
   }
   
   /** @pdGenerated default parent setter
     * @param new部门表 */
   public void set部门表(部门表 new部门表) {
      if (this.部门表 == null || !this.部门表.equals(new部门表))
      {
         if (this.部门表 != null)
         {
            部门表 old部门表 = this.部门表;
            this.部门表 = null;
            old部门表.remove用户表(this);
         }
         if (new部门表 != null)
         {
            this.部门表 = new部门表;
            this.部门表.add用户表(this);
         }
      }
   }

}