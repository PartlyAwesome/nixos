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
        anammox = {
          enable = true;
          billing = false;
        };
        atSomeone.enable = true;
        betterBlockedUsers.enable = true;
        betterQuickReact = {
          enable = true;
          rows = 3.0;
          columns = 6.0;
          compactMode = true;
        };
        betterSettings.enable = true;
        allCallTimers = {
          enable = true;
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
        favoriteGifSearch.enable = true;
        fixYoutubeEmbeds.enable = true;
        friendCloud.enable = true;
        friendsSince.enable = true;
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
        selfForward.enable = true;
        sendTimestamps.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        showTimeoutDuration.enable = true;
        silentTyping.enable = true;
        sortFriendRequests = {
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
  #  programs.vesktop = {
  #    enable = true;
  #    vencord = {
  #      themes = {
  #        catppuccin = ./catt+fixes.css;
  #      };
  #      settings = {
  #        enabledThemes = ["catppuccin.css"];
  #        plugins = {
  #          AlwaysAnimate.enabled = true;
  #          ClearURLs.enabled = true;
  #          CopyStickerLinks.enabled = true;
  #          Dearrow = {
  #            enabled = true;
  #            replaceElements = 1;
  #          };
  #          DisableCallIdle.enabled = true;
  #          DontRoundMyTimestamps.enabled = true;
  #          Experiments.enabled = true;
  #          ExpressionCloner.enabled = true;
  #          FavoriteGifSearch.enabled = true;
  #          FixImagesQuality.enabled = true;
  #          FixYoutubeEmbeds.enabled = true;
  #          FriendsSince.enabled = true;
  #          FullUserInChatbox.enabled = true;
  #          GifPaste.enabled = true;
  #          GreetStickerPicker.enabled = true;
  #          LoadingQuotes.enabled = true;
  #          MemberCount.enabled = true;
  #          MentionAvatars.enabled = true;
  #          MutualGroupDMs.enabled = true;
  #          NoDevtoolsWarning.enabled = true;
  #          NoF1.enabled = true;
  #          NoProfileThemes.enabled = true;
  #          NoReplyMention.enabled = true;
  #          NoUnblockToJump.enabled = true;
  #          OpenInApp = {
  #            enabled = true;
  #            epic = false;
  #          };
  #          PlatformIndicators.enabled = true;
  #          RelationshipNotifier = {
  #            enabled = true;
  #            notices = true;
  #          };
  #          ReplyTimestamp.enabled = true;
  #          ReverseImageSearch.enabled = true;
  #          RoleColorEverywhere.enabled = true;
  #          SendTimestamps.enabled = true;
  #          ShowConnections.enabled = true;
  #          ShowHiddenChannels.enabled = true;
  #          ShowHiddenThings.enabled = true;
  #          SilentMessageToggle.enabled = true;
  #          SilentTyping.enabled = true;
  #          SortFriendRequests.enabled = true;
  #          SuperReactionTweaks = {
  #            enabled = true;
  #            superReactByDefault = false;
  #            unlimitedSuperReactionPlaying = true;
  #            superReactionPlayingLimit = 100;
  #          };
  #          Translate.enabled = true;
  #          TypingIndicator = {
  #            enabled = true;
  #            includeMutedChannels = true;
  #            includeBlockedUsers = true;
  #          };
  #          TypingTweaks.enabled = true;
  #          UnlockedAvatarZoom.enabled = true;
  #          UserMessagePronouns.enabled = true;
  #          UserVoiceShow.enabled = true;
  #          ValidReply.enabled = true;
  #          ValidUser.enabled = true;
  #          ViewIcons = {
  #            enabled = true;
  #            format = "png";
  #            imgSize = "4096";
  #          };
  #          VoiceDownload.enabled = true;
  #          VoiceMessages = {
  #            enabled = true;
  #            noiseSuppression = false;
  #            echoCancellation = false;
  #          };
  #          VolumeBooster = {
  #            enabled = true;
  #            multiplier = 3;
  #          };
  #          WhoReacted.enabled = true;
  #          YoutubeAdblock.enabled = true;
  #        };
  #      };
  #    };
  #  };
}
