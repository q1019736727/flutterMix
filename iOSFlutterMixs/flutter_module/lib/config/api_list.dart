
const service_host = 'https://test-hainan.app-chengdu1.yunzhicloud.com';
const bx_servicehost = 'https://wxmini.baixingliangfan.cn';

const homebannerKey = 'HomeBanner';
const homenavgationKey = 'homenavgation';
const homeRecommandKey = 'homeRecommand';
const homeHotKey = 'homeHot';

const getCategoryKey = 'getCategoryKey';
const getCategoryGoodsKey = 'getCategoryGoodsKey';
const getGoodsDetailKey = 'getGoodsDetailKey';

const api_list = {
  homebannerKey: service_host + '/api/info/app/recommend/page',
  homenavgationKey: service_host + '/api/info/app/navigation/list',
  homeRecommandKey: service_host + '/api/search/search/search',
  homeHotKey: service_host + '/api/info/app/recommend/page',
  
  getCategoryKey: bx_servicehost + '/baixing/wxmini/getCategory',
  getCategoryGoodsKey: bx_servicehost + '/baixing/wxmini/getMallGoods',
  getGoodsDetailKey: bx_servicehost + '/baixing/wxmini/getGoodDetailById',
};
