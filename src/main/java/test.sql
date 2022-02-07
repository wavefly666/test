select a.mark_id
     , a.mark_id_bhv
     , a.mark_id_real
     , a.pvid
     , a.feed_id
     , a.uid
     , a.ps_id
     , a.platform_type
     , a.platform
     , a.location_code
     , a.creative_id
     , a.deliver_id
     , case
           when a.bid_type = 1 then 'OCPM'
           when a.bid_type = 2 then 'CPV'
           when a.bid_type = 4 then 'CPM'
           when a.bid_type = 8 then 'CPE'
           when a.bid_type = 12 then 'CPC'
           when a.bid_type = 13 then 'OCPC'
    end                      as bid_type --'竞价类型'
     , a.promotion_objective as promotion_objective_code
     , a.compaign_id
     , a.cust_uid
     , a.creative_style_id
     , a.is_delivery_garanteed
     , a.is_native_ads
     , a.log_version
     , a.pv_time
     , a.route_path
     , a.public_extend
     , a.time_eclipsed
     , a.app_info
     , a.client_appid
     , a.client_appversion
     , a.network_type
     , a.feed_position
     , a.app_side
     , a.termination_info
     , a.os_brand
     , a.os_type
     , a.os_version
     , a.os_imei
     , a.user_ip
     , a.user_agent
     , a.attachment
     , a.wm
     , a.deliver_type
     , a.bid_price
     , a.cost_price
     , a.bucket_id
     , a.rank_match_info
     , a.promotion_object_info
     , a.feed_type
     , a.appid
     , a.ad_target_info
     , a.age
     , a.gender
     , a.location_code1
     , a.location_code2
     , a.is_fans
     , a.ads_attributes
     , a.cust_type
     , a.title_type
     , a.status
     , a.extend
     , a.pos
     , channel.channel_code
     , a.c2s_eff_cost_num
     , a.eff_bid_num
     , a.imp_cnt
     , a.bhv_cnt
     , a.eff_bhv_cnt
     , a.cost_bhv_cnt
     , a.bhv_tran_cnt
     , a.bhv_comment_cnt
     , a.bhv_atten_cnt
     , a.bhv_collect_cnt
     , a.bhv_like_cnt
     , a.bhv_head_cnt
     , a.bhv_nick_cnt
     , a.bhv_at_cnt
     , a.bhv_topic_cnt
     , a.bhv_after_video_cnt
     , a.bhv_short_url_cnt
     , a.bhv_img_text_bcard_cnt
     , a.bhv_img_text_btn_bcard_cnt
     , a.bhv_video_text_bcard_cnt
     , a.bhv_video_bcard_cnt
     , a.bhv_app_img_bcard_cnt
     , a.bhv_app_discribe_bcard_cnt
     , a.bhv_app_btn_bcard_cnt
     , a.bhv_nine_block_lable_cnt
     , a.bhv_nine_block_btn_cnt
     , a.bhv_carousel_img_cnt
     , a.bhv_carousel_text_cnt
     , a.bhv_carousel_btn_cnt
     , a.bhv_carousel_short_url_cnt
     , a.bhv_display_window_cnt
     , a.bhv_after_video_down_cnt
     , a.bhv_before_video_btn_cnt
     , a.bhv_playing_video_btn_cnt
     , a.bhv_see_and_buy_cnt
     , a.bhv_reprint_cnt
     , a.bhv_corner_cnt
     , a.bhv_see_and_down_cnt
     , a.bhv_app_url_cnt
     , a.bhv_mobile_video_cnt
     , a.bhv_mobile_video_ge_3s_cnt
     , a.bhv_mobile_video_lt_3s_cnt
     , a.bhv_after_recmd_replay_cnt
     , a.bhv_pc_video_cnt
     , a.bhv_common_video_cnt
     , a.bhv_complex_video_cnt
     , a.bhv_auto_video_wax_cnt
     , a.bhv_manual_video_wax_cnt
     , a.bhv_music_cnt
     , a.bhv_sideslip_img_cnt
     , a.bhv_sideslip_card_cnt
     , a.bhv_text_page_cnt
     , a.bhv_app_more_page_cnt
     , a.bhv_img_cnt
     , a.bhv_sidesplip_cnt
     , a.bhv_high_light_cnt
     , a.bhv_corner_appear_cnt
     , a.bhv_see_and_down_click_cnt
     , a.bhv_app_activation_cnt
     , a.stream_guidance_cnt
     , a.social_contact_cnt
     , a.bhv_read_cnt
     , a.music_video_play_cnt
     , a.bhv_pc_video_cnt_click_cnt
     , a.bhv_pc_video_cnt_auto_gt_3_cnt
     , a.bhv_pc_video_cnt_auto_le_3_cnt
     , a.bhv_m_v_click_cnt
     , a.bhv_m_v_auto_gt_3_cnt
     , a.bhv_m_v_auto_le_3_cnt
     , a.imp_real_cnt
     , a.imp_real_1s_cnt
     , a.imp_real_2s_cnt
     , a.clk_time_array
     , a.bhv_code_array
     , a.filter_array
     , a.bhv_extend1_array
     , a.bhv_extend2_array
     , a.adclick_count_cnt
     , a.code_filters
     , crea.activate_moni                --监测链接
     , case
           when a.promotion_objective = '88030002' and a.code_filters is not null and a.code_filters!='-' and
       a.code_filters
    !='' and crea.activate_moni is not null then
	ActivateBehaviourCount(a.code_filters, crea.activate_moni, '${all_behaviour1}')
	when a.promotion_objective<>'88030002' and a.code_filters is not null and a.code_filters!='-' and a.code_filters!='' and crea.activate_moni is not null then
	ActivateBehaviourCount(a.code_filters, crea.activate_moni, '${all_behaviour}')
	else 0
end as send_clk_cnt --点击行为(发送给有激活监测链接的广告主)
	--,'' as activate_moni --crea.activate_moni --监测链接
	--,0 as send_clk_cnt
	,a.c2s_imp_cnt
	,case
	when (app_monitor_type='0' or app_monitor_type='11000') and a.algo_click_cnt>0 then '1' --互动
	when (app_monitor_type='10000') and a.algo_click_cnt1>0 then '1'                                 --点击
	else '0'
end as algo_click_cnt --应用app的点击行为
	,a.optimization_objective
	,algo_click_cnt2
	,a.c2s_eff_bid_num as c2s_eff_bid_num --'结算出价金额'
	,case when a.algo_click_attent_cnt>0 then '1' else '0'
end as algo_click_attent_cnt --算法涨粉关注点击次数
	,rank_info
	,rank_ad_info_new
	--,a.no_remove_duplicate_imp_real_cnt
	--,a.no_remove_duplicate_imp_real_1s_cnt
	--,a.no_remove_duplicate_imp_real_2s_cnt
	--,a.remove_duplicate_imp_real_cnt
	--,a.remove_duplicate_imp_real_1s_cnt
	--,a.remove_duplicate_imp_real_2s_cnt
	,case
	when (app_monitor_type='0' or app_monitor_type='11000') and a.algo_click_cnt0>0 then '1' --互动
	when (app_monitor_type='10000') and a.algo_click_cnt1>0 then '1'                                 --点击
	else '0'
end as algo_click_cnt0 --应用app的点击行为用于白名单
	,case
	when (app_monitor_type='0' or app_monitor_type='11000') and a.algo_click_5s_cnt>0 then '1' --互动
	when (app_monitor_type='10000') and a.algo_click_cnt1>0 then '1'                                 --点击
	else '0'
end as algo_click_5s_cnt --应用app的点击行为
	,reyun_year_bhv_cnt
	,reyun_month_bhv_cnt
	,case when owner_id is not null and owner_id<>'' then owner_id else a.cust_uid
end as cost_uid
	,a.follow_bhv_atten_cnt
	,a.product_category
	,a.new_fliter_stream_guidance_cnt
	,rank_not_null_flag
from
	(select
		COALESCE(imp.cust_uid,behavior.cust_uid,real.cust_uid,'-') cust_uid,
		nvl(imp.compaign_id,behavior.compaign_id)      as compaign_id,
		COALESCE(imp.deliver_id,behavior.deliver_id,real.deliver_id,'-') as deliver_id,
		nvl(imp.bid_type,behavior.bid_type)        as bid_type,
		nvl(imp.promotion_objective,behavior.promotion_objective)  as promotion_objective,
		COALESCE(imp.creative_id,behavior.creative_id,real.creative_id,'-') as creative_id,
		nvl(imp.platform_type,'-') as platform_type,
		nvl(imp.location_code,'-') as location_code,
		nvl(imp.creative_style_id,'-')as creative_style_id,
		nvl(imp.is_delivery_garanteed,behavior.is_delivery_garanteed) as is_delivery_garanteed,
		COALESCE(imp.ps_id,behavior.ps_id,real.ps_id,'-') as ps_id,
		nvl(imp.pv_uid,behavior.uid)     as uid,
		nvl(imp.feed_id,behavior.object_id)    as feed_id,
		COALESCE(imp.mark_id,behavior.mark_id,real.markid,'-')    as mark_id,
		nvl(imp.mark_id,'-')       as mark_id_imp,
		nvl(rank.rank_info,'-')       as rank_info,
		nvl(rank.rank_ad_info_new,'-')       as rank_ad_info_new,
		nvl(rank.reyun_year_bhv_cnt,'-')       as reyun_year_bhv_cnt,
		nvl(rank.reyun_month_bhv_cnt,'-')       as reyun_month_bhv_cnt,
		nvl(behavior.mark_id,'-')      as mark_id_bhv,
		nvl(real.markid,'-')       as mark_id_real,
		nvl(imp.pvid,'-')        as pvid,
		nvl(imp.is_native_ads,'-')      as is_native_ads,
		nvl(imp.log_version,'-')      as log_version,
		nvl(imp.pv_time,'-')       as pv_time,
		nvl(imp.route_path,'-')       as route_path,
		nvl(imp.public_extend,'-')      as public_extend,
		nvl(imp.time_eclipsed,'-')      as time_eclipsed,
		nvl(imp.app_info,'-')       as app_info,
		nvl(imp.client_appid,'-')      as client_appid,
		nvl(imp.client_appversion,'-')     as client_appversion,
		nvl(imp.network_type,'-')      as network_type,
		nvl(imp.feed_position,behavior.feed_position)     as feed_position,
		nvl(imp.app_side,'-')       as app_side,
		nvl(imp.termination_info,'-')     as termination_info,
		nvl(imp.os_brand,'-')       as os_brand,
		nvl(imp.os_type,'-')       as os_type,
		nvl(imp.os_version,'-')       as os_version,
		nvl(imp.os_imei,'-')       as os_imei,
		nvl(imp.user_ip,'-')       as user_ip,
		nvl(imp.user_agent,'-')       as user_agent,
		nvl(imp.attachment,'-')       as attachment,
		nvl(imp.platform,'-')       as platform,
		nvl(imp.wm,'-')         as wm,
		nvl(imp.deliver_type,'-')      as deliver_type,
		nvl(imp.bid_price,'-')       as bid_price,
		nvl(imp.cost_price,'-')       as cost_price,
		nvl(imp.bucket_id,'-')       as bucket_id,
		nvl(imp.rank_match_info,'-')     as rank_match_info,
		nvl(imp.promotion_object_info,'-')    as promotion_object_info,
		nvl(imp.feed_type,'-')       as feed_type,
		nvl(imp.appid,'-')        as appid,
		nvl(imp.ad_target_info,'-')      as ad_target_info,
		nvl(imp.age,'-')        as age,
		nvl(imp.gender,'-')        as gender,
		nvl(imp.location_code1,'-')      as location_code1,
		nvl(imp.location_code2,'-')      as location_code2,
		nvl(imp.is_fans,'-')       as is_fans,
		nvl(imp.ads_attributes,'-')      as ads_attributes,
		nvl(imp.cust_type,'-')       as cust_type,
		nvl(imp.title_type,'-')       as title_type,
		nvl(imp.status,'-')        as status,
		nvl(imp.extend,'-')        as extend,
		nvl(imp.pos,'-')        as pos,
		nvl(imp.optimization_objective,'-')        as optimization_objective,
		product_category,
		nvl(imp.owner_id,'-') as owner_id,
		--case when imp.mark_id is not null then 1 else 0 end as imp_cnt, --'曝光次数',
		nvl(imp_cnt,0)as imp_cnt,
		nvl(behavior.bhv_cnt,0) as bhv_cnt,       --'互动次数',
		nvl(behavior.eff_bhv_cnt,0) as eff_bhv_cnt,     --'有效互动次数',
		nvl(behavior.cost_bhv_cnt,0) as cost_bhv_cnt,    --'计费互动次数',
		nvl(behavior.bhv_tran_cnt,0) as bhv_tran_cnt        ,   --'转发次数',
		nvl(behavior.bhv_comment_cnt,0) as bhv_comment_cnt      ,   --'评论次数',
		nvl(behavior.bhv_atten_cnt,0) as bhv_atten_cnt       ,   --'关注次数',
		nvl(behavior.follow_bhv_atten_cnt,0) as follow_bhv_atten_cnt       ,   --'关注次数',
		nvl(behavior.new_fliter_stream_guidance_cnt,0) as new_fliter_stream_guidance_cnt       ,   --'导流电商互动次数',
		nvl(behavior.bhv_collect_cnt,0) as bhv_collect_cnt      ,   --'收藏次数',
		nvl(behavior.bhv_like_cnt,0) as bhv_like_cnt        ,   --'赞次数',
		nvl(behavior.bhv_head_cnt,0) as bhv_head_cnt        ,   --'点击头像次数',
		nvl(behavior.bhv_nick_cnt,0) as bhv_nick_cnt        ,   --'点击昵称次数',
		nvl(behavior.bhv_at_cnt,0) as bhv_at_cnt         ,   --'点击@次数',
		nvl(behavior.bhv_topic_cnt,0) as bhv_topic_cnt       ,   --'点击话题次数',
		nvl(behavior.bhv_after_video_cnt,0) as bhv_after_video_cnt    ,   --'视频后推荐转发次数',
		nvl(behavior.bhv_short_url_cnt,0) as bhv_short_url_cnt     ,   --'点击短链次数',
		nvl(behavior.bhv_img_text_bcard_cnt,0) as bhv_img_text_bcard_cnt   ,   --'点击图文大card次数',
		nvl(behavior.bhv_img_text_btn_bcard_cnt,0) as bhv_img_text_btn_bcard_cnt ,   --'点击图文大card按钮次数',
		nvl(behavior.bhv_video_text_bcard_cnt,0) as bhv_video_text_bcard_cnt  ,   --'点击复合视频card文字区域次数',
		nvl(behavior.bhv_video_bcard_cnt,0) as bhv_video_bcard_cnt    ,   --'点击视频大card按钮次数',
		nvl(behavior.bhv_app_img_bcard_cnt,0) as bhv_app_img_bcard_cnt   ,   --'点击应用家大card图片区域次数',
		nvl(behavior.bhv_app_discribe_bcard_cnt,0) as bhv_app_discribe_bcard_cnt ,   --'点击应用家大card描述区域次数',
		nvl(behavior.bhv_app_btn_bcard_cnt,0) as bhv_app_btn_bcard_cnt    ,   --'点击应用家大card按钮区域次数',
		nvl(behavior.bhv_nine_block_lable_cnt,0) as bhv_nine_block_lable_cnt  ,   --'点击应用家九宫格图片标签次数',
		nvl(behavior.bhv_nine_block_btn_cnt,0) as bhv_nine_block_btn_cnt   ,   --'点击应用家九宫格图片按钮次数',
		nvl(behavior.bhv_carousel_img_cnt,0) as bhv_carousel_img_cnt    ,   --'点击轮播广告图片区次数',
		nvl(behavior.bhv_carousel_text_cnt,0) as bhv_carousel_text_cnt   ,   --'点击轮播广告文字区次数',
		nvl(behavior.bhv_carousel_btn_cnt,0) as bhv_carousel_btn_cnt    ,   --'点击轮播广告按钮区次数',
		nvl(behavior.bhv_carousel_short_url_cnt,0) as bhv_carousel_short_url_cnt ,   --'点击轮播广告短链次数',
		nvl(behavior.bhv_display_window_cnt,0) as bhv_display_window_cnt   ,   --'橱窗点击次数',
		nvl(behavior.bhv_after_video_down_cnt,0) as bhv_after_video_down_cnt  ,   --'视频播放后下载数',
		nvl(behavior.bhv_before_video_btn_cnt,0) as bhv_before_video_btn_cnt  ,   --'视频播放前点击下载按钮次数',
		nvl(behavior.bhv_playing_video_btn_cnt,0) as bhv_playing_video_btn_cnt ,   --'视频播放中点击下载按钮次数',
		nvl(behavior.bhv_see_and_buy_cnt,0) as bhv_see_and_buy_cnt    ,   --'边看边买次数',
		nvl(behavior.bhv_reprint_cnt,0) as bhv_reprint_cnt      ,   --'翻版点击次数',
		nvl(behavior.bhv_corner_cnt,0) as bhv_corner_cnt       ,   --'角标点击次数',
		nvl(behavior.bhv_see_and_down_cnt,0) as bhv_see_and_down_cnt    ,   --'边看边下次数',
		nvl(behavior.bhv_app_url_cnt,0) as bhv_app_url_cnt      ,   --'应用家点击链接次数',
		nvl(behavior.bhv_mobile_video_cnt,0) as bhv_mobile_video_cnt    ,   --'移动端视频播放点击播放次数',
		nvl(behavior.bhv_mobile_video_ge_3s_cnt,0) as bhv_mobile_video_ge_3s_cnt ,   --'移动端视频自动播放大于等于3秒次数',
		nvl(behavior.bhv_mobile_video_lt_3s_cnt,0) as bhv_mobile_video_lt_3s_cnt ,   --'移动端视频自动播放小于3秒次数',
		nvl(behavior.bhv_after_recmd_replay_cnt,0) as bhv_after_recmd_replay_cnt ,   --'后推荐-重播次数',
		nvl(behavior.bhv_pc_video_cnt,0) as bhv_pc_video_cnt      ,   --'PC视频播放次数',
		nvl(behavior.bhv_common_video_cnt,0) as bhv_common_video_cnt    ,   --'点击播放普通视频（610之前）次数',
		nvl(behavior.bhv_complex_video_cnt,0) as bhv_complex_video_cnt   ,   --'点击播放复合视频（610之前）次数',
		nvl(behavior.bhv_auto_video_wax_cnt,0) as bhv_auto_video_wax_cnt   ,   --' 视频自动播放（WAX）次数',
		nvl(behavior.bhv_manual_video_wax_cnt,0) as bhv_manual_video_wax_cnt  ,   --' 用户点击播放视频（WAX）次数',
		nvl(behavior.bhv_music_cnt,0) as bhv_music_cnt       ,   --'点击播放音乐次数',
		nvl(behavior.bhv_sideslip_img_cnt,0) as bhv_sideslip_img_cnt    ,   --'横滑图片次数',
		nvl(behavior.bhv_sideslip_card_cnt,0) as bhv_sideslip_card_cnt    ,   --'轮播广告card横滑次数',
		nvl(behavior.bhv_text_page_cnt,0) as bhv_text_page_cnt      ,   --'点击微博正文页次数',
		nvl(behavior.bhv_app_more_page_cnt,0) as bhv_app_more_page_cnt   ,   --'应用家点击更多页次数',
		nvl(behavior.bhv_img_cnt,0) as bhv_img_cnt        ,   --'点击图片次数',
		nvl(behavior.bhv_sidesplip_cnt,0) as bhv_sidesplip_cnt     ,   --'横滑次数',
		nvl(behavior.bhv_high_light_cnt,0) as bhv_high_light_cnt     ,   --'推荐流视频高亮次数',
		nvl(behavior.bhv_corner_appear_cnt,0) as bhv_corner_appear_cnt    ,   --'角标出现次数',
		nvl(behavior.bhv_see_and_down_click_cnt,0) as bhv_see_and_down_click_cnt ,   --'边看边下下载点击次数',
		nvl(behavior.bhv_app_activation_cnt,0) as bhv_app_activation_cnt  ,   --'App激活次数',
		nvl(behavior.bhv_music_video_cnt,0) as bhv_music_video_cnt     ,   --'音视频互动量'
		nvl(behavior.stream_guidance_cnt,0) as stream_guidance_cnt     ,   -- '导流互动次数',
		nvl(behavior.social_contact_cnt,0) as social_contact_cnt     ,   -- '社交互动次数',
		nvl(behavior.bhv_read_cnt,0) as bhv_read_cnt        ,   -- '行为阅读互动次数',
		nvl(behavior.music_video_play_cnt,0) as music_video_play_cnt    ,   -- '音视频播放次数',
		nvl(imp.bid_price,0) as eff_bid_num,             --'出价金额',
		nvl(behavior.bhv_pc_video_cnt_click_cnt,0) as bhv_pc_video_cnt_click_cnt ,
		nvl(behavior.bhv_pc_video_cnt_auto_gt_3_cnt,0) as bhv_pc_video_cnt_auto_gt_3_cnt ,
		nvl(behavior.bhv_pc_video_cnt_auto_le_3_cnt,0) as bhv_pc_video_cnt_auto_le_3_cnt ,
		nvl(behavior.bhv_m_v_click_cnt,0)  as bhv_m_v_click_cnt ,
		nvl(behavior.bhv_m_v_auto_gt_3_cnt,0) as bhv_m_v_auto_gt_3_cnt ,
		nvl(behavior.bhv_m_v_auto_le_3_cnt,0) as bhv_m_v_auto_le_3_cnt,
		nvl(behavior.algo_click_cnt,0) as algo_click_cnt, --算法用app点击次数
		nvl(behavior.algo_click_cnt1,0) as algo_click_cnt1, --算法用app点击次数
		nvl(behavior.algo_click_cnt0,0) as algo_click_cnt0, --算法用app点击次数
		nvl(behavior.algo_click_5s_cnt,0) as algo_click_5s_cnt, --算法用app点击次数
		nvl(behavior.algo_click_attent_cnt,0) as algo_click_attent_cnt, --算法涨粉关注点击次数
		nvl(imp_real_cnt,0) as imp_real_cnt,
		nvl(imp_real_1s_cnt,0) as imp_real_1s_cnt,
		nvl(imp_real_2s_cnt,0) as imp_real_2s_cnt,
		--nvl(no_remove_duplicate_imp_real_cnt,0) as no_remove_duplicate_imp_real_cnt,
		--nvl(no_remove_duplicate_imp_real_1s_cnt,0) as no_remove_duplicate_imp_real_1s_cnt,
		--nvl(no_remove_duplicate_imp_real_2s_cnt,0) as no_remove_duplicate_imp_real_2s_cnt,
		--nvl(remove_duplicate_imp_real_cnt,0) as remove_duplicate_imp_real_cnt,
		--nvl(remove_duplicate_imp_real_1s_cnt,0) as remove_duplicate_imp_real_1s_cnt,
		--nvl(remove_duplicate_imp_real_2s_cnt,0) as remove_duplicate_imp_real_2s_cnt,
		clk_time_array,
		bhv_code_array,
		filter_array,
		bhv_extend1_array,
		bhv_extend2_array,
		nvl(adclick_count_cnt,0) as adclick_count_cnt,
		nvl(code_filters,'-') as code_filters,
		nvl(s2s_imp_cnt,0)+nvl(c2s_imp_cnt,0) as c2s_imp_cnt,       --'结算曝光次数'
		case when COALESCE(imp.bid_type,behavior.bid_type,c2s.bid_type) in ('2','8','12','13') then nvl(behavior.bhv_consume,0)
		else (nvl(imp.s2s_imp_consume,0)+nvl(c2s.c2s_imp_consume,0)) end as c2s_eff_cost_num,          --'结算消耗金额',
		nvl(imp.s2s_bid_price,0)+(case when c2s.mark_id is not null and imp.mark_id is not null then nvl(imp.bid_price,0) else 0 end) as c2s_eff_bid_num,
		case when third.pvid is not null then '1' else '0' end as algo_click_cnt2,
		case when rank.mark_id is not null then '1' else '0' end as rank_not_null_flag
	from
	(
		select
		  case when platform= 'pc' then 'pc'
		  when substring(platform,7,1) = '3' then 'iphone'
		  when substring(platform,7,1) = '5' then 'android' else '-' end as platform_type
		  ,platform
		  ,log_version
		  ,pv_time
		  ,route_path
		  ,pvid
		  ,public_extend
		  ,time_eclipsed
		  ,ps_id
		  ,app_info
		  ,client_appid
		  ,client_appversion
		  ,network_type
		  ,feed_position
		  ,mark_id
		  ,app_side
		  ,termination_info
		  ,os_brand
		  ,os_type
		  ,os_version
		  ,os_imei
		  ,user_ip
		  ,user_agent
		  ,pv_uid
		  ,location_code
		  ,attachment
		  ,wm
		  ,deliver_id
		  ,deliver_type
		  ,cost_price
		  ,bucket_id
		  ,rank_match_info
		  ,promotion_object_info
		  ,feed_type
		  ,object_id
		  ,appid
		  ,ad_target_info
		  ,age
		  ,gender
		  ,location_code1
		  ,location_code2
		  ,is_fans
		  ,cust_uid
		  ,bid_type
		  ,compaign_id
		  ,promotion_objective
		  ,creative_id
		  ,creative_style_id
		  ,feed_id
		  ,ads_attributes
		  ,is_delivery_garanteed
		  ,is_native_ads
		  ,cust_type
		  ,title_type
		  ,status
		  ,extend
		  ,pos
		  ,optimization_objective
		  ,product_category
		  ,max(split(ads_attributes,':')[25]) as owner_id
		  ,count(*) as imp_cnt
		  ,sum(case when third_party_monitor_type='0' then 1 else 0 end) as s2s_imp_cnt
		  ,sum(case when third_party_monitor_type='0' then nvl(cost_price,0)/10000 else 0 end) as s2s_imp_consume
		  ,sum(case when third_party_monitor_type='0' then nvl(bid_price,0)/10000 else 0 end) as s2s_bid_price
		  ,sum(nvl(bid_price,0)/10000) as bid_price
	  from
	  default.ods_ad_sfst_impression_promptly
	  where dt='${start_ymd}' and hour='${start_hour}' and deliver_type=783 and status=0
	  group by
	  case when platform= 'pc' then 'pc'
	  when substring(platform,7,1) = '3' then 'iphone'
	  when substring(platform,7,1) = '5' then 'android' else '-' end
	  ,platform
	  ,log_version
	  ,pv_time
	  ,route_path
	  ,pvid
	  ,public_extend
	  ,time_eclipsed
	  ,ps_id
	  ,app_info
	  ,client_appid
	  ,client_appversion
	  ,network_type
	  ,feed_position
	  ,mark_id
	  ,app_side
	  ,termination_info
	  ,os_brand
	  ,os_type
	  ,os_version
	  ,os_imei
	  ,user_ip
	  ,user_agent
	  ,pv_uid
	  ,location_code
	  ,attachment
	  ,wm
	  ,deliver_id
	  ,deliver_type
	  ,cost_price
	  ,bucket_id
	  ,rank_match_info
	  ,promotion_object_info
	  ,feed_type
	  ,object_id
	  ,appid
	  ,ad_target_info
	  ,age
	  ,gender
	  ,location_code1
	  ,location_code2
	  ,is_fans
	  ,cust_uid
	  ,bid_type
	  ,compaign_id
	  ,promotion_objective
	  ,creative_id
	  ,creative_style_id
	  ,feed_id
	  ,ads_attributes
	  ,is_delivery_garanteed
	  ,is_native_ads
	  ,cust_type
	  ,title_type
	  ,status
	  ,extend
	  ,pos
	  ,optimization_objective
	  ,product_category
	)imp
	left join
	(select
		mark_id,
		concat_ws('&&&',rank_user_info,rank_ad_info,rank_match_info) as rank_info,
		rank_ad_info_new,
		reyun_year_bhv_cnt,reyun_month_bhv_cnt
	from dplus_fdm.fdm_wb_ad_sfst_rank_info_new_hour where dt='${start_ymd}' and hour='${start_hour}')rank
	on split(imp.mark_id,'_')[1]=split(rank.mark_id,'_')[1]  --混排导致特征日志的mark_id的下划线前面的位置会变
	left join
	(select
		is_delivery_garanteed,
		cust_uid,
		compaign_id,
		deliver_id,
		bid_type,
		promotion_objective,
		creative_id,
		feed_position,
		ps_id,
		object_id,
		uid,
		mark_id,
		count(*) as bhv_cnt,               --'互动次数',
		sum(case when bhv.filter='0' then cost_price else 0 end) as bhv_consume,        --'cpe消耗金额'
		case when dt<'20181001' then
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1' and (hhv_code.is_ctr_exp_r_flow_gt_3='0' or (hhv_code.is_ctr_exp_r_flow_gt_3 <> '0' and (isautoplay='0' or (isautoplay='1' and valid_play_duration>3))))) then 1 else 0 end)
		else
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1' and ((hhv_code.is_ctr_gt_3='0' or (hhv_code.is_two_type_code='1' and adclick_count>0)) or (hhv_code.is_ctr_gt_3 <> '0' and (isautoplay='0' or (isautoplay='1' and valid_play_duration>3))))) then 1 else 0 end)
		end as eff_bhv_cnt,     --'有效互动次数',,
		sum(case when (hhv_code.is_bhv_cost='1' and bhv_filter.is_cost ='1') then 1 else 0 end) as cost_bhv_cnt,     --'计费互动次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='14000003' then 1 else 0 end) as bhv_tran_cnt     ,   --'转发次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='14000005' then 1 else 0 end) as bhv_comment_cnt    ,   --'评论次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='14000008' then 1 else 0 end) as bhv_atten_cnt    ,   --'关注次数',          --'关注次数',
		sum(case when bhv.filter in ('0','10000')  and (extend1=cust_uid or extend1=owner_id or extend1=fans_payer_uid) and bhv.bhv_code='14000008' then 1 else 0 end) as follow_bhv_atten_cnt,  --'follow关注次数，和成本控制口径对齐',          --'关注次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='14000045' then 1 else 0 end) as bhv_collect_cnt    ,   --'收藏次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='14000098' then 1 else 0 end) as bhv_like_cnt     ,   --'赞次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='21000001' then 1 else 0 end) as bhv_head_cnt     ,   --'点击头像次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='21000002' then 1 else 0 end) as bhv_nick_cnt     ,   --'点击昵称次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='21000003' then 1 else 0 end) as bhv_at_cnt     ,   --'点击@次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='21000004' then 1 else 0 end) as bhv_topic_cnt    ,   --'点击话题次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000003' then 1 else 0 end) as bhv_after_video_cnt   ,   --'视频后推荐转发次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='14000014' then 1 else 0 end) as bhv_short_url_cnt   ,   --'点击短链次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='22000001' then 1 else 0 end) as bhv_img_text_bcard_cnt  ,   --'点击图文大card次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='22000002' then 1 else 0 end) as bhv_img_text_btn_bcard_cnt ,   --'点击图文大card按钮次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='25000001' then 1 else 0 end) as bhv_video_text_bcard_cnt  ,   --'点击复合视频card文字区域次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='25000002' then 1 else 0 end) as bhv_video_bcard_cnt   ,   --'点击视频大card按钮次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='27000001' then 1 else 0 end) as bhv_app_img_bcard_cnt  ,   --'点击应用家大card图片区域次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='27000002' then 1 else 0 end) as bhv_app_discribe_bcard_cnt ,   --'点击应用家大card描述区域次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='27000003' then 1 else 0 end) as bhv_app_btn_bcard_cnt  ,   --'点击应用家大card按钮区域次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='27000005' then 1 else 0 end) as bhv_nine_block_lable_cnt  ,   --'点击应用家九宫格图片标签次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='27000006' then 1 else 0 end) as bhv_nine_block_btn_cnt  ,   --'点击应用家九宫格图片按钮次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='29000001' then 1 else 0 end) as bhv_carousel_img_cnt   ,   --'点击轮播广告图片区次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='29000002' then 1 else 0 end) as bhv_carousel_text_cnt  ,   --'点击轮播广告文字区次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='29000003' then 1 else 0 end) as bhv_carousel_btn_cnt   ,   --'点击轮播广告按钮区次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='29000005' then 1 else 0 end) as bhv_carousel_short_url_cnt ,   --'点击轮播广告短链次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='60000001' then 1 else 0 end) as bhv_display_window_cnt  ,   --'橱窗点击次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000006' then 1 else 0 end) as bhv_after_video_down_cnt  ,   --'视频播放后下载数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000010' then 1 else 0 end) as bhv_before_video_btn_cnt  ,   --'视频播放前点击下载按钮次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000011' then 1 else 0 end) as bhv_playing_video_btn_cnt ,   --'视频播放中点击下载按钮次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000030' then 1 else 0 end) as bhv_see_and_buy_cnt   ,   --'边看边买次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000060' then 1 else 0 end) as bhv_reprint_cnt    ,   --'翻版点击次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000070' then 1 else 0 end) as bhv_corner_cnt    ,   --'角标点击次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000089' and (isautoplay='0' or (isautoplay='1' and valid_play_duration>3)) then 1 else 0 end) as bhv_see_and_down_cnt   ,   --'边看边下次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='50000005' then 1 else 0 end) as bhv_app_url_cnt    ,   --'应用家点击链接次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000001' and isautoplay='0' then 1 else 0 end) as bhv_mobile_video_cnt   ,   --'移动端视频播放点击播放次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000001' and (isautoplay='1' and valid_play_duration>3) then 1 else 0 end) as bhv_mobile_video_ge_3s_cnt ,   --'移动端视频自动播放大于等于3秒次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000001' and (isautoplay='1' and valid_play_duration<=3) then 1 else 0 end) as bhv_mobile_video_lt_3s_cnt ,   --'移动端视频自动播放小于3秒次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000002' then 1 else 0 end) as bhv_after_recmd_replay_cnt ,   --'后推荐-重播次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000008' and (isautoplay='0' or (isautoplay='1' and valid_play_duration>3)) then 1 else 0 end) as bhv_pc_video_cnt    ,   --'PC视频播放次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='23000001' and (isautoplay='0' or (isautoplay='1' and valid_play_duration>3)) then 1 else 0 end) as bhv_common_video_cnt   ,   --'点击播放普通视频（610之前）次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='25000003' and (isautoplay='0' or (isautoplay='1' and valid_play_duration>3)) then 1 else 0 end) as bhv_complex_video_cnt  ,   --'点击播放复合视频（610之前）次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000092' then 1 else 0 end) as bhv_auto_video_wax_cnt  ,   --' 视频自动播放（WAX）次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000091' then 1 else 0 end) as bhv_manual_video_wax_cnt  ,   --' 用户点击播放视频（WAX）次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='24000001' and (isautoplay='0' or (isautoplay='1' and valid_play_duration>3)) then 1 else 0 end) as bhv_music_cnt    ,   --'点击播放音乐次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='27000004' then 1 else 0 end) as bhv_sideslip_img_cnt   ,   --'横滑图片次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='29000004' then 1 else 0 end) as bhv_sideslip_card_cnt  ,   --'轮播广告card横滑次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='50000001' then 1 else 0 end) as bhv_text_page_cnt   ,   --'点击微博正文页次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='50000002' then 1 else 0 end) as bhv_app_more_page_cnt  ,   --'应用家点击更多页次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='50000004' then 1 else 0 end) as bhv_img_cnt     ,   --'点击图片次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='28000001' then 1 else 0 end) as bhv_sidesplip_cnt   ,   --'横滑次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000020' then 1 else 0 end) as bhv_high_light_cnt   ,   --'推荐流视频高亮次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000090' then 1 else 0 end) as bhv_corner_appear_cnt  ,   --'角标出现次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000099' then 1 else 0 end) as bhv_see_and_down_click_cnt ,   --'边看边下下载点击次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='70000001' then 1 else 0 end) as bhv_app_activation_cnt  ,   --'App激活次数',
		0 as bhv_music_video_cnt,                           --'音视频互动量'
		case when dt<'20181001' then
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and hhv_code.bhv_type_code='BHVTYPE0001' then 1 else 0 end)
		else
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and
		((hhv_code.bhv_type_code='BHVTYPE0001' and hhv_code.is_two_type_code='0') or (hhv_code.is_two_type_code='1' and adclick_count>0)) then 1 else 0 end)
		end
		as stream_guidance_cnt,   -- 导流互动次数
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and hhv_code.bhv_type_code='BHVTYPE0002' then 1 else 0 end) as social_contact_cnt,   -- 社交互动次数
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and hhv_code.bhv_type_code='BHVTYPE0003' then 1 else 0 end) as bhv_read_cnt,    -- 行为阅读互动次数
		case when dt<'20181001' then
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and hhv_code.bhv_type_code='BHVTYPE0004' and (isautoplay='0' or (isautoplay='1' and valid_play_duration>3)) then 1 else 0 end)
		else
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and ((hhv_code.bhv_type_code='BHVTYPE0004' and hhv_code.is_ctr_gt_3='0') or (((hhv_code.bhv_type_code='BHVTYPE0004' and hhv_code.is_ctr_gt_3<>'0') or hhv_code.is_two_type_code='1') and (isautoplay='0' or (isautoplay='1' and valid_play_duration>3)))) then 1 else 0 end)
		end as music_video_play_cnt,   --音视频播放次数
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000008' and isautoplay='0' then 1 else 0 end) as bhv_pc_video_cnt_click_cnt   ,   --'PC端视频播放点击播放次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000008' and (isautoplay='1' and valid_play_duration>3) then 1 else 0 end) as bhv_pc_video_cnt_auto_gt_3_cnt ,   --'PC端视频视频自动播放大于等于3秒次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and bhv.bhv_code='80000008' and (isautoplay='1' and valid_play_duration<=3) then 1 else 0 end) as bhv_pc_video_cnt_auto_le_3_cnt ,   --'PC端视频视频自动播放小于3秒次数',
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and ((hhv_code.bhv_type_code='BHVTYPE0004' and hhv_code.is_ctr_gt_3 = '0') or (hhv_code.is_ctr_gt_3 ='1' and isautoplay='0')) then 1 else 0 end) as bhv_m_v_click_cnt,          -- 音视频手动点击次数
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and hhv_code.is_ctr_gt_3 = '1' and isautoplay='1' and valid_play_duration>3 then 1 else 0 end) as bhv_m_v_auto_gt_3_cnt,   -- 音视频自动播放大于3秒次数
		sum(case when (bhv_filter.is_ctr='1' and hhv_code.is_bhv_ctr='1') and hhv_code.is_ctr_gt_3 = '1' and isautoplay='1' and valid_play_duration<=3 then 1 else 0 end) as bhv_m_v_auto_le_3_cnt,   -- 音视频自动播放小于等于3秒次数
		sum(case when (hhv_code.algo_app_bhv='1' and (bhv.bhv_code<>'50000004' or (bhv.bhv_code='50000004' and promotion_objective='88030002'))) or (hhv_code.algo_app_bhv='2' and (advplay_start_time<3 and advplay_end_time>=3)) or (hhv_code.algo_app_bhv='3' and (((advplay_start_time<3 and advplay_end_time>=3) and nvl(adclick_count,0)<=0) or adclick_count>0)) then 1 else 0 end) as algo_click_cnt, --算法用app互动次数(对应雷达type1-4)
		sum(case when (hhv_code.algo_app_bhv='1' and (bhv.bhv_code<>'50000004' or (bhv.bhv_code='50000004' and promotion_objective='88030002'))) or (hhv_code.algo_app_bhv='2' and (advplay_start_time<5 and advplay_end_time>=5)) or (hhv_code.algo_app_bhv='3' and (((advplay_start_time<5 and advplay_end_time>=5) and nvl(adclick_count,0)<=0) or adclick_count>0)) then 1 else 0 end) as algo_click_5s_cnt, --算法用app互动次数(对应雷达type1-4)
		sum(case when (hhv_code.algo_app_bhv in ('1','2','3') and (bhv.bhv_code<>'50000004' or (bhv.bhv_code='50000004' and promotion_objective='88030002'))) then 1 else 0 end) as algo_click_cnt0, --算法用app互动次数(对应雷达type1-4)
		sum(case when (hhv_code.algo_app_bhv_click='1' and (bhv.bhv_code<>'50000004' or (bhv.bhv_code='50000004' and promotion_objective='88030002'))) or (hhv_code.algo_app_bhv_click='3' and  adclick_count>0) then 1 else 0 end) as algo_click_cnt1, --算法用app点击次数(对应雷达type1)
		sum(case when bhv.filter in ('0','10000') and bhv.bhv_code='14000008' then 1 else 0 end) as algo_click_attent_cnt, --算法用app点击次数

		sum(case when (bhv_filter.is_eff='1' and hhv_code.is_bhv_ctr='1') and
		((hhv_code.bhv_type_code='BHVTYPE0001' and hhv_code.is_two_type_code='0') or (hhv_code.is_two_type_code='1' and adclick_count>0))
		then 1 else 0 end) as new_fliter_stream_guidance_cnt,   -- 导流互动次数(0,10000过滤码)

		collect_set(clk_time) as clk_time_array,
		collect_set(bhv.bhv_code) as bhv_code_array,
		collect_list(filter) as filter_array,
		collect_set(extend1) as bhv_extend1_array,
		collect_set(extend2) as bhv_extend2_array,
		sum(cast(nvl(adclick_count_cnt,0) as bigint)) as adclick_count_cnt,
		concat_ws(',',collect_list(concat_ws(':', bhv.bhv_code, filter))) as code_filters
	from
	(
		select
			cust_uid,
			compaign_id,
			deliver_id,
			clk_time,
			bid_type,
			promotion_objective,
			creative_id,
			feed_position,
			ps_id,
			object_id,
			uid,mark_id,
			nvl(cost_price,0)/10000 as cost_price,
			bhv_code,
			is_delivery_garanteed,
			adclick_count as adclick_count_cnt,
			filter,
			extend2,
			dt,
			open_app,extend1,
			case when extend2 is not null then str_to_map(extend2,'\\\\|',':')['isautoplay'] else null end as isautoplay,
			(case when extend2 is not null then str_to_map(extend2,'\\\\|',':')['valid_play_duration'] else null end)/1000 as valid_play_duration,
			(case when extend2 is not null then str_to_map(extend2,'\\\\|',':')['adclick_count'] else null end) as adclick_count,
			cast(split((case when extend2 is not null then str_to_map(extend2,'\\\\|',':')['advplay'] else null end),',')[0] as double) as advplay_start_time,
			cast(split((case when extend2 is not null then str_to_map(extend2,'\\\\|',':')['advplay'] else null end),',')[1] as double) as advplay_end_time,
			split(extend,':')[9] as owner_id,
			split(extend,':')[14] as fans_payer_uid
		from default.ods_ad_sfst_behavior_promptly where ((dt='${start_ymd}' and hour='${start_hour}') or (dt='${end_ymd}' and hour='${end_hour}'))
		and ad_type='783' and mark_id is not null
	)bhv
	left join dplus_dim.dim_wb_ad_bhv_code hhv_code
	on bhv.bhv_code=hhv_code.bhv_code
	left join
	dplus_dim.dim_wb_ad_bhv_filter bhv_filter
	on bhv.filter=bhv_filter.filter_code
	group by cust_uid,compaign_id,deliver_id,bid_type,promotion_objective,creative_id,feed_position,ps_id,object_id,uid,mark_id,dt,is_delivery_garanteed
	)behavior
	on imp.mark_id=behavior.mark_id
	left join
	(select
	   pvid
	  from default.ods_ad_all_third_monitor_s2s_hour where product_code='sfst_active'  and extend8='0' -- extend8 为send_type, 取为0的，20200706上线
	  and ((dt='${start_ymd}' and hour='${start_hour}') or (dt='${end_ymd}' and hour='${end_hour}'))
	  group by pvid
	)third
	on imp.mark_id=third.pvid
	left outer join
	(select markid,
	  cust_uid,
	  deliver_id,
	  creative_id,
	  ps_id,
	  sum(case when stime is not null then 1 else 0 end) as imp_real_cnt,
	  sum(case when mtime is not null and etime is not null and (etime-mtime)>1000 then 1 else 0 end ) as imp_real_1s_cnt,
	  sum(case when mtime is not null and etime is not null and (etime-mtime)>2000 then 1 else 0 end ) as imp_real_2s_cnt
	--  sum(case when against_cheating_code in ('0','20003','20004','20005','20006') and stime is not null then 1 else 0 end) as no_remove_duplicate_imp_real_cnt,
	--  sum(case when against_cheating_code in ('0','20003','20004','20005','20006') and mtime>0 and mtime is not null and etime is not null and  (etime-mtime)>1000 then 1 else 0 end ) as no_remove_duplicate_imp_real_1s_cnt,
	--  sum(case when against_cheating_code in ('0','20003','20004','20005','20006') and mtime>0 and mtime is not null and etime is not null and  (etime-mtime)>2000 then 1 else 0 end ) as no_remove_duplicate_imp_real_2s_cnt,
	--  max(case when against_cheating_code='0' and  stime is not null then 1 else 0 end) as remove_duplicate_imp_real_cnt,
	--  max(case when against_cheating_code='0' and mtime>0 and mtime is not null and etime is not null and (etime-mtime)>1000 then 1 else 0 end ) as remove_duplicate_imp_real_1s_cnt,
	--  max(case when against_cheating_code='0' and mtime>0 and mtime is not null and etime is not null and (etime-mtime)>2000 then 1 else 0 end ) as remove_duplicate_imp_real_2s_cnt
	 from dplus_dwd.dwd_wb_ad_realexpo_hour where dt='${start_ymd}' and hour='${start_hour}' and ad_product_type='783'
	 group by markid,cust_uid,deliver_id,creative_id,ps_id
	) real
	on nvl(imp.mark_id,behavior.mark_id)=real.markid
	left join
	(select
	  case when platform= 'pc' then 'pc'
	  when substring(platform,7,1) = '3' then 'iphone'
	  when substring(platform,7,1) = '5' then 'android' else '-' end as platform_type
	  ,platform
	  ,log_version
	  ,pv_time
	  ,route_path
	  ,pvid
	  ,public_extend
	  ,time_eclipsed
	  ,ps_id
	  ,app_info
	  ,client_appid
	  ,client_appversion
	  ,network_type
	  ,feed_position
	  ,mark_id
	  ,app_side
	  ,termination_info
	  ,os_brand
	  ,os_type
	  ,os_version
	  ,os_imei
	  ,user_ip
	  ,user_agent
	  ,pv_uid
	  ,location_code
	  ,attachment
	  ,wm
	  ,deliver_id
	  ,deliver_type
	  ,cost_price
	  ,bucket_id
	  ,rank_match_info
	  ,promotion_object_info
	  ,feed_type
	  ,object_id
	  ,appid
	  ,ad_target_info
	  ,age
	  ,gender
	  ,location_code1
	  ,location_code2
	  ,is_fans
	  ,cust_uid
	  ,bid_type
	  ,compaign_id
	  ,promotion_objective
	  ,creative_id
	  ,creative_style_id
	  ,feed_id
	  ,ads_attributes
	  ,is_delivery_garanteed
	  ,is_native_ads
	  ,cust_type
	  ,title_type
	  ,status
	  ,extend
	  ,pos
	  ,count(*) as c2s_imp_cnt
	  ,sum(nvl(cost_price,0)/10000) as c2s_imp_consume
	  ,sum(nvl(bid_price,0)/10000) as c2s_bid_price
	  from
	  default.ods_ad_sfst_impression_c2s_hour
	  where ((dt='${start_ymd}' and hour='${start_hour}') or (dt='${end_ymd}' and hour='${end_hour}')) and deliver_type='783' and third_party_monitor_type='11' and  (guaranty_type='0' or guaranty_type is null) --超粉为0 和null ,其他为新品超品
	  group by
	  case when platform= 'pc' then 'pc'
	  when substring(platform,7,1) = '3' then 'iphone'
	  when substring(platform,7,1) = '5' then 'android' else '-' end
	  ,platform
	  ,log_version
	  ,pv_time
	  ,route_path
	  ,pvid
	  ,public_extend
	  ,time_eclipsed
	  ,ps_id
	  ,app_info
	  ,client_appid
	  ,client_appversion
	  ,network_type
	  ,feed_position
	  ,mark_id
	  ,app_side
	  ,termination_info
	  ,os_brand
	  ,os_type
	  ,os_version
	  ,os_imei
	  ,user_ip
	  ,user_agent
	  ,pv_uid
	  ,location_code
	  ,attachment
	  ,wm
	  ,deliver_id
	  ,deliver_type
	  ,cost_price
	  ,bucket_id
	  ,rank_match_info
	  ,promotion_object_info
	  ,feed_type
	  ,object_id
	  ,appid
	  ,ad_target_info
	  ,age
	  ,gender
	  ,location_code1
	  ,location_code2
	  ,is_fans
	  ,cust_uid
	  ,bid_type
	  ,compaign_id
	  ,promotion_objective
	  ,creative_id
	  ,creative_style_id
	  ,feed_id
	  ,ads_attributes
	  ,is_delivery_garanteed
	  ,is_native_ads
	  ,cust_type
	  ,title_type
	  ,status
	  ,extend
	  ,pos
	)c2s
	on imp.mark_id=c2s.mark_id
	) a
	left join
	(
	select cust_uid,channel_code
	from dplus_dwd.dwd_wb_ad_channel_hour where dt='${start_ymd}' and hour='${start_hour}'
	)channel
	on a.cust_uid=channel.cust_uid
	left join
	(select creativeid,activate_moni,app_monitor_type from dplus_dwd.dwd_wb_ad_sfst_creativeid_monitor_hour where  dt='${start_ymd}' and hour='$start_hour')crea
	on a.creative_id=crea.creativeid;