<?php

namespace Unit1\SecondModule\Block\Html;

class FooterCustomize
{
    public function afterGetCopyright(\Magento\Theme\Block\Html\Footer $result)
    {
        return "Customized copyright!";
    }
}