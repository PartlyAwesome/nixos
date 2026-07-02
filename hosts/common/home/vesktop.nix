{inputs, ...}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];
  programs.nixcord = {
    enable = true;
    discord.vencord.enable = false;
    discord.equicord.enable = true;
    discord.autoscroll.enable = true;
    equibop.enable = true;
    equibop.autoscroll.enable = true;
    config = {
      disableMinSize = true;
      themes = {
        catppuccin = ./catt+fixes.css;
      };
      enabledThemes = ["catppuccin.css"];
      plugins = {
        alwaysAnimate.enable = true;
        declutter = {
          enable = true;
          removeButtonTooltips = false;
          removeClanTag = false;
        };
        atSomeone.enable = true;
        betterBlockedUsers.enable = true;
        moreQuickReactions = {
          enable = true;
          rows = 3.0;
          columns = 6.0;
          compactMode = true;
        };
        betterSettings.enable = true;
        callTimer = {
          enable = true;
          allCallTimers = true;
          showSeconds = true;
          showWithoutHover = true;
          trackSelf = true;
        };
        characterCounter.enable = true;
        ClearURLs.enable = true;
        copyStickerLinks.enable = true;
        crashHandler.enable = true;
        customIdle = {
          enable = true;
          idleTimeout = 0.0;
        };
        dearrow = {
          enable = true;
          replaceElements = 1;
        };
        disableCallIdle.enable = true;
        dontRoundMyTimestamps.enable = true;
        expressionCloner.enable = true;
        fakeNitro.enable = true;
        favoriteGifSearch.enable = true;
        fixYoutubeEmbeds.enable = true;
        friendshipRanks.enable = true;
        FullVCPFP.enable = true;
        gifPaste.enable = true;
        gitHubRepos.enable = true;
        greetStickerPicker = {
          enable = true;
          greetMode = "Message";
        };
        homeTyping.enable = true;
        implicitRelationships.enable = true;
        IRememberYou.enable = true;
        jumpTo.enable = true;
        loadingQuotes.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        MutualGroupDMs.enable = true;
        neverPausePreviews.enable = true;
        messageColors.enable = true;
        noF1.enable = true;
        noNitroUpsell.enable = true;
        noProfileThemes.enable = true;
        noReplyMention.enable = true;
        noUnblockToJump.enable = true;
        platformIndicators.enable = true;
        relationshipNotifier = {
          enable = true;
          notices = true;
        };
        replyTimestamp.enable = true;
        ReviewDB.enable = true;
        roleColorEverywhere.enable = true;
        reverseImageSearch.enable = true;
        secretRingToneEnabler = {
          enable = true;
          onlySnow = true;
        };
        betterForwards = {
          enable = true;
          selfForward = true;
        };
        sendTimestamps.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        showTimeoutDuration.enable = true;
        silentTyping.enable = true;
        sortFriends = {
          enable = true;
          showDates = true;
        };
        superReactionTweaks = {
          enable = true;
          superReactByDefault = false;
          superReactionPlayingLimit = 100.0;
          unlimitedSuperReactionPlaying = true;
        };
        timezones = {
          enable = true;
          _24hTime = true;
        };
        translate.enable = true;
        typingIndicator = {
          enable = true;
          includeIgnoredUsers = true;
          includeBlockedUsers = true;
        };
        toneIndicators.enable = true;
        unlockedAvatarZoom.enable = true;
        userMessagesPronouns.enable = true;
        userVoiceShow.enable = true;
        voiceDownload.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        viewIcons = {
          enable = true;
          format = "png";
          imgSize = "4096";
        };
        voiceMessages = {
          enable = true;
          echoCancellation = false;
          noiseSuppression = false;
        };
        volumeBooster = {
          enable = true;
          multiplier = 3.0;
        };
        webScreenShareFixes.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
