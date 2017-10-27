<?php

namespace Unit1\SecondModule\Model;

class ProductPrice
{
    public function afterGetPrice(\Magento\Catalog\Model\Product $subject, $result)
    {
        return $result+11;
    }
}