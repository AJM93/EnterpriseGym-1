/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Stores;

/**
 *
 * @author Dreads
 */
public class CarouselImageStore 
{
    private int Id;
    private String ImageLink;
    private String CaptionLink;
    private String CaptionText;
    
    public CarouselImageStore(final int Id, final String ImageLink, final String CaptionLink, final String CaptionText)
    {
        this.Id = Id;
        this.ImageLink = ImageLink;
        this.CaptionLink = CaptionLink;
        this.CaptionText = CaptionText;
    }
    public int getId()
    {
        return this.Id;
    }
    public void setId(final int Id)
    {
        this.Id = Id;
    }
    public String getImageLink()
    {
        return this.ImageLink;
    }
    public void setImageLink(final String ImageLink)
    {
        this.ImageLink = ImageLink;
    }
    public String getCaptionLink()
    {
        return this.CaptionLink;
    }
    public void setCaptionLink(final String CaptionLink)
    {
        this.CaptionLink = CaptionLink;
    }
    public String getCaptionText()
    {
        return this.CaptionText;
    }
    public void setCaptionText(final String CaptionText)
    {
        this.CaptionText = CaptionText;
    }
}
