<?php

namespace Unit1\SecondModule\Block\Html;

class BreadcrumbsCustomize
{
    public function beforeAddCrumb(\Magento\Theme\Block\Html\Breadcrumbs $subject, $crumbName, $crumbInfo)
    {
        $crumbName = $crumbName . "(!)";
        //$crumbInfo['label'] = $crumbInfo['label'] . "(!)";
        return [$crumbName, $crumbInfo];

    }
}