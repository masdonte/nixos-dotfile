{pkgs, config, ... }:

{
  programs.firefox = {
    enable = true;
  };

  programs.qutebrowser = {
    enable = true;
    enableDefaultBindings = true;
    keyBindings = {
      normal = {
        ",v" = "hint links spawn mpv {hint-url}";
        ",V" = "spawn mpv {hint-url}";
        };
        };
        settings = {
        auto_save.session = true;
        content = {
        autoplay = false;
        blocking = {
        enabled = true;
        method = "both"; # Brave’s ABP-style adblocker & host
        whitelist = [ ];
        hosts.lists = [
          "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
          "https://www.github.developerdan.com/hosts/lists/facebook-extended.txt"
          "https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-hosts.txt"
        ];
        adblock.lists = [
          "https://easylist.to/easylist/easylist.txt"
          "https://easylist.to/easylist/easyprivacy.txt"
          "https://paulgb.github.io/BarbBlock/blacklists/hosts-file.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2022.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/legacy.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/lan-block.txt"
          "https://raw.githubusercontent.com/brave/adblock-lists/master/coin-miners.txt"
          "https://raw.githubusercontent.com/brave/adblock-lists/master/brave-unbreak.txt"
          "https://raw.githubusercontent.com/brave/adblock-lists/master/brave-lists/brave-social.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt"
          "https://secure.fanboy.co.nz/fanboy-annoyance.txt"
          "https://pgl.yoyo.org/as/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext&_=223428"
          "https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts"
          "https://raw.githubusercontent.com/MajkiIT/polish-ads-filter/master/polish-adblock-filters/adblock.txt"
          "https://raw.githubusercontent.com/MajkiIT/polish-ads-filter/master/adblock_social_filters/adblock_social_list.txt"
          "https://raw.githubusercontent.com/MajkiIT/polish-ads-filter/master/cookies_filters/adblock_cookies.txt"
          "https://raw.githubusercontent.com/FiltersHeroes/PolishAnnoyanceFilters/master/PPB.txt"
          "https://raw.githubusercontent.com/FiltersHeroes/PolishAntiAnnoyingSpecialSupplement/master/polish_rss_filters.txt"
          "https://raw.githubusercontent.com/FiltersHeroes/KAD/master/KAD.txt"
          "https://alleblock.pl/alleblock/alleblock.txt"
          "https://raw.githubusercontent.com/olegwukr/polish-privacy-filters/master/anti-adblock.txt"
          "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
          "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt"
          "https://fanboy.co.nz/r/fanboy-ultimate.txt"
          "https://fanboy.co.nz/fanboy-antifacebook.txt"
          "https://fanboy.co.nz/fanboy-annoyance.txt"
          "https://fanboy.co.nz/fanboy-cookiemonster.txt"
          "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
          "https://github.com/DandelionSprout/adfilt/raw/master/AnnoyancesList"
          "https://github.com/DandelionSprout/adfilt/raw/master/SocialShareList.txt"
          "https://github.com/DandelionSprout/adfilt/raw/master/ExtremelyCondensedList.txt"
        ];
      };
    };
  };


};
    }

