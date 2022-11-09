package com.shopReview.model.entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.Objects;

@Entity
@Table(name = "shop_review", schema = "ba_rei", catalog = "")
public class ShopReview {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "SHOP_REVIEW_ID")
    private int shopReviewId;
    @Basic
    @Column(name = "ITEM_ID")
    private int itemId;
    @Basic
    @Column(name = "MEM_ID")
    private int memId;
    @Basic
    @Column(name = "SHOP_COMMENT_CONTENT")
    private String shopCommentContent;
    @Basic
    @Column(name = "SHOP_COMMENT_DATE")
    private Date shopCommentDate;
    @Basic
    @Column(name = "SHOP_SATISFACTION")
    private Byte shopSatisfaction;

    public int getShopReviewId() {
        return shopReviewId;
    }

    public void setShopReviewId(int shopReviewId) {
        this.shopReviewId = shopReviewId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getMemId() {
        return memId;
    }

    public void setMemId(int memId) {
        this.memId = memId;
    }

    public String getShopCommentContent() {
        return shopCommentContent;
    }

    public void setShopCommentContent(String shopCommentContent) {
        this.shopCommentContent = shopCommentContent;
    }

    public Date getShopCommentDate() {
        return shopCommentDate;
    }

    public void setShopCommentDate(Date shopCommentDate) {
        this.shopCommentDate = shopCommentDate;
    }

    public Byte getShopSatisfaction() {
        return shopSatisfaction;
    }

    public void setShopSatisfaction(Byte shopSatisfaction) {
        this.shopSatisfaction = shopSatisfaction;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ShopReview that = (ShopReview) o;
        return shopReviewId == that.shopReviewId && itemId == that.itemId && memId == that.memId && Objects.equals(shopCommentContent, that.shopCommentContent) && Objects.equals(shopCommentDate, that.shopCommentDate) && Objects.equals(shopSatisfaction, that.shopSatisfaction);
    }

    @Override
    public int hashCode() {
        return Objects.hash(shopReviewId, itemId, memId, shopCommentContent, shopCommentDate, shopSatisfaction);
    }
}
