package model;

import java.io.Serializable;

public class Review implements Serializable
{
    private int num;
    private String seller ;
    private String id;
    private int productStar;
    private int deliveryStar;
    private int serviceStar;
    public int getNum()
    {
        return num;
    }
    public void setNum(int num)
    {
        this.num = num;
    }
    public String getSeller()
    {
        return seller;
    }
    public void setSeller(String seller)
    {
        this.seller = seller;
    }
    public String getId()
    {
        return id;
    }
    public void setId(String id)
    {
        this.id = id;
    }
    public int getProductStar()
    {
        return productStar;
    }
    public void setProductStar(int productStar)
    {
        this.productStar = productStar;
    }
    public int getDeliveryStar()
    {
        return deliveryStar;
    }
    public void setDeliveryStar(int deliveryStar)
    {
        this.deliveryStar = deliveryStar;
    }
    public int getServiceStar()
    {
        return serviceStar;
    }
    public void setServiceStar(int serviceStar)
    {
        this.serviceStar = serviceStar;
    }  

    
}
