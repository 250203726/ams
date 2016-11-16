/***********************************************************************
 * Module:  资产信息表.java
 * Author:  simon
 * Purpose: Defines the Class 资产信息表
 ***********************************************************************/

import java.util.*;

/** @pdOid 7f10d80b-5ea6-49f9-849c-bd73d9b0864e */
public class 资产信息表 {
   /** @pdOid ddf03cf5-c677-451b-81be-79e997c0dddc */
   public java.lang.String 资产编号;
   /** @pdOid 938ecb22-ccc0-4f99-8a54-cc3fec661f17 */
   public int 资产出厂编号;
   /** @pdOid a234b2be-a020-4f9c-a1bc-c932e3d4946e */
   public int 所属项目编号;
   /** @pdOid 5951d953-7a7b-4ed9-b222-efb8cc08c9bb */
   public java.lang.String 资产品牌;
   /** @pdOid 5bf67a13-9f08-4f27-89e1-aabc5a1e569c */
   public java.lang.String 资产型号;
   /** @pdOid 3b7050f2-104c-4ae3-9269-e87f7060ce37 */
   public float 资产价格;
   /** @pdOid 99b2c0b8-c5b4-4aa9-a999-4c02e64c9dcd */
   public java.lang.String 图片;
   /** @pdOid 53647608-3fa2-4c12-b1a8-d197411bc0d8 */
   public java.lang.String 资产状态;
   /** @pdOid e259345a-3f3c-4912-a1b9-d81a3ea3970e */
   public java.lang.String 采购人;
   /** @pdOid e7cbf99a-5829-4a26-977d-02b6e06b054c */
   public java.util.Date 制造日期;
   /** @pdOid 93f49ffa-52ad-4105-8f24-69a4b79e9f91 */
   public java.util.Date 购买日期;
   /** @pdOid fa2d32ba-5dc6-488d-a403-9e2dd99cddce */
   public java.util.Date 启用日期;
   /** @pdOid adc3b58f-b116-42f4-a1f0-af586ee8b3ee */
   public java.lang.String 安装地点;
   /** @pdOid 0491e9d7-be66-48f7-93ac-f9861cebe38a */
   public java.util.Date 使用年限;
   /** @pdOid 7632ad9c-59ab-492f-ba90-922649476b09 */
   public java.util.Date 生命年限;
   /** @pdOid d01f22ee-25ca-4762-aaa2-2bce3717ee45 */
   public java.lang.String 备注;
   
   /** @pdRoleInfo migr=no name=资产调拨表 assc=reference10 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<资产调拨表> 资产调拨表;
   /** @pdRoleInfo migr=no name=资产报损表 assc=reference12 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<资产报损表> 资产报损表;
   /** @pdRoleInfo migr=no name=资产维护记录表 assc=reference13 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<资产维护记录表> 资产维护记录表;
   /** @pdRoleInfo migr=no name=资产名称表 assc=reference3 mult=0..1 side=A */
   public 资产名称表 资产名称表;
   /** @pdRoleInfo migr=no name=用户表 assc=reference4 mult=0..1 side=A */
   public 用户表 用户表;
   /** @pdRoleInfo migr=no name=厂商信息表 assc=reference6 mult=0..1 side=A */
   public 厂商信息表 厂商信息表;
   /** @pdRoleInfo migr=no name=供应商信息表 assc=reference7 mult=0..1 side=A */
   public 供应商信息表 供应商信息表;
   /** @pdRoleInfo migr=no name=项目表 assc=reference8 mult=0..1 side=A */
   public 项目表 项目表;
   /** @pdRoleInfo migr=no name=维护公司信息表 assc=reference9 mult=0..1 side=A */
   public 维护公司信息表 维护公司信息表;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<资产调拨表> get资产调拨表() {
      if (资产调拨表 == null)
         资产调拨表 = new java.util.HashSet<资产调拨表>();
      return 资产调拨表;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIterator资产调拨表() {
      if (资产调拨表 == null)
         资产调拨表 = new java.util.HashSet<资产调拨表>();
      return 资产调拨表.iterator();
   }
   
   /** @pdGenerated default setter
     * @param new资产调拨表 */
   public void set资产调拨表(java.util.Collection<资产调拨表> new资产调拨表) {
      removeAll资产调拨表();
      for (java.util.Iterator iter = new资产调拨表.iterator(); iter.hasNext();)
         add资产调拨表((资产调拨表)iter.next());
   }
   
   /** @pdGenerated default add
     * @param new资产调拨表 */
   public void add资产调拨表(资产调拨表 new资产调拨表) {
      if (new资产调拨表 == null)
         return;
      if (this.资产调拨表 == null)
         this.资产调拨表 = new java.util.HashSet<资产调拨表>();
      if (!this.资产调拨表.contains(new资产调拨表))
      {
         this.资产调拨表.add(new资产调拨表);
         new资产调拨表.set资产信息表(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param old资产调拨表 */
   public void remove资产调拨表(资产调拨表 old资产调拨表) {
      if (old资产调拨表 == null)
         return;
      if (this.资产调拨表 != null)
         if (this.资产调拨表.contains(old资产调拨表))
         {
            this.资产调拨表.remove(old资产调拨表);
            old资产调拨表.set资产信息表((资产信息表)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAll资产调拨表() {
      if (资产调拨表 != null)
      {
         资产调拨表 old资产调拨表;
         for (java.util.Iterator iter = getIterator资产调拨表(); iter.hasNext();)
         {
            old资产调拨表 = (资产调拨表)iter.next();
            iter.remove();
            old资产调拨表.set资产信息表((资产信息表)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<资产报损表> get资产报损表() {
      if (资产报损表 == null)
         资产报损表 = new java.util.HashSet<资产报损表>();
      return 资产报损表;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIterator资产报损表() {
      if (资产报损表 == null)
         资产报损表 = new java.util.HashSet<资产报损表>();
      return 资产报损表.iterator();
   }
   
   /** @pdGenerated default setter
     * @param new资产报损表 */
   public void set资产报损表(java.util.Collection<资产报损表> new资产报损表) {
      removeAll资产报损表();
      for (java.util.Iterator iter = new资产报损表.iterator(); iter.hasNext();)
         add资产报损表((资产报损表)iter.next());
   }
   
   /** @pdGenerated default add
     * @param new资产报损表 */
   public void add资产报损表(资产报损表 new资产报损表) {
      if (new资产报损表 == null)
         return;
      if (this.资产报损表 == null)
         this.资产报损表 = new java.util.HashSet<资产报损表>();
      if (!this.资产报损表.contains(new资产报损表))
      {
         this.资产报损表.add(new资产报损表);
         new资产报损表.set资产信息表(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param old资产报损表 */
   public void remove资产报损表(资产报损表 old资产报损表) {
      if (old资产报损表 == null)
         return;
      if (this.资产报损表 != null)
         if (this.资产报损表.contains(old资产报损表))
         {
            this.资产报损表.remove(old资产报损表);
            old资产报损表.set资产信息表((资产信息表)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAll资产报损表() {
      if (资产报损表 != null)
      {
         资产报损表 old资产报损表;
         for (java.util.Iterator iter = getIterator资产报损表(); iter.hasNext();)
         {
            old资产报损表 = (资产报损表)iter.next();
            iter.remove();
            old资产报损表.set资产信息表((资产信息表)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<资产维护记录表> get资产维护记录表() {
      if (资产维护记录表 == null)
         资产维护记录表 = new java.util.HashSet<资产维护记录表>();
      return 资产维护记录表;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIterator资产维护记录表() {
      if (资产维护记录表 == null)
         资产维护记录表 = new java.util.HashSet<资产维护记录表>();
      return 资产维护记录表.iterator();
   }
   
   /** @pdGenerated default setter
     * @param new资产维护记录表 */
   public void set资产维护记录表(java.util.Collection<资产维护记录表> new资产维护记录表) {
      removeAll资产维护记录表();
      for (java.util.Iterator iter = new资产维护记录表.iterator(); iter.hasNext();)
         add资产维护记录表((资产维护记录表)iter.next());
   }
   
   /** @pdGenerated default add
     * @param new资产维护记录表 */
   public void add资产维护记录表(资产维护记录表 new资产维护记录表) {
      if (new资产维护记录表 == null)
         return;
      if (this.资产维护记录表 == null)
         this.资产维护记录表 = new java.util.HashSet<资产维护记录表>();
      if (!this.资产维护记录表.contains(new资产维护记录表))
      {
         this.资产维护记录表.add(new资产维护记录表);
         new资产维护记录表.set资产信息表(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param old资产维护记录表 */
   public void remove资产维护记录表(资产维护记录表 old资产维护记录表) {
      if (old资产维护记录表 == null)
         return;
      if (this.资产维护记录表 != null)
         if (this.资产维护记录表.contains(old资产维护记录表))
         {
            this.资产维护记录表.remove(old资产维护记录表);
            old资产维护记录表.set资产信息表((资产信息表)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAll资产维护记录表() {
      if (资产维护记录表 != null)
      {
         资产维护记录表 old资产维护记录表;
         for (java.util.Iterator iter = getIterator资产维护记录表(); iter.hasNext();)
         {
            old资产维护记录表 = (资产维护记录表)iter.next();
            iter.remove();
            old资产维护记录表.set资产信息表((资产信息表)null);
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
            old资产名称表.remove资产信息表(this);
         }
         if (new资产名称表 != null)
         {
            this.资产名称表 = new资产名称表;
            this.资产名称表.add资产信息表(this);
         }
      }
   }
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
            old用户表.remove资产信息表(this);
         }
         if (new用户表 != null)
         {
            this.用户表 = new用户表;
            this.用户表.add资产信息表(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public 厂商信息表 get厂商信息表() {
      return 厂商信息表;
   }
   
   /** @pdGenerated default parent setter
     * @param new厂商信息表 */
   public void set厂商信息表(厂商信息表 new厂商信息表) {
      if (this.厂商信息表 == null || !this.厂商信息表.equals(new厂商信息表))
      {
         if (this.厂商信息表 != null)
         {
            厂商信息表 old厂商信息表 = this.厂商信息表;
            this.厂商信息表 = null;
            old厂商信息表.remove资产信息表(this);
         }
         if (new厂商信息表 != null)
         {
            this.厂商信息表 = new厂商信息表;
            this.厂商信息表.add资产信息表(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public 供应商信息表 get供应商信息表() {
      return 供应商信息表;
   }
   
   /** @pdGenerated default parent setter
     * @param new供应商信息表 */
   public void set供应商信息表(供应商信息表 new供应商信息表) {
      if (this.供应商信息表 == null || !this.供应商信息表.equals(new供应商信息表))
      {
         if (this.供应商信息表 != null)
         {
            供应商信息表 old供应商信息表 = this.供应商信息表;
            this.供应商信息表 = null;
            old供应商信息表.remove资产信息表(this);
         }
         if (new供应商信息表 != null)
         {
            this.供应商信息表 = new供应商信息表;
            this.供应商信息表.add资产信息表(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public 项目表 get项目表() {
      return 项目表;
   }
   
   /** @pdGenerated default parent setter
     * @param new项目表 */
   public void set项目表(项目表 new项目表) {
      if (this.项目表 == null || !this.项目表.equals(new项目表))
      {
         if (this.项目表 != null)
         {
            项目表 old项目表 = this.项目表;
            this.项目表 = null;
            old项目表.remove资产信息表(this);
         }
         if (new项目表 != null)
         {
            this.项目表 = new项目表;
            this.项目表.add资产信息表(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public 维护公司信息表 get维护公司信息表() {
      return 维护公司信息表;
   }
   
   /** @pdGenerated default parent setter
     * @param new维护公司信息表 */
   public void set维护公司信息表(维护公司信息表 new维护公司信息表) {
      if (this.维护公司信息表 == null || !this.维护公司信息表.equals(new维护公司信息表))
      {
         if (this.维护公司信息表 != null)
         {
            维护公司信息表 old维护公司信息表 = this.维护公司信息表;
            this.维护公司信息表 = null;
            old维护公司信息表.remove资产信息表(this);
         }
         if (new维护公司信息表 != null)
         {
            this.维护公司信息表 = new维护公司信息表;
            this.维护公司信息表.add资产信息表(this);
         }
      }
   }

}