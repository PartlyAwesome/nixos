{inputs, ...}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];
  programs.nixcord = {
    enable = true;
    discord.vencord.enable = false;
    discord.equicord.enable = true;
    equibop.enable = true;
    config = {
      themes = {
        catppuccin = ./catt+fixes.css;
      };
      enabledThemes = ["catppuccin.css"];
      plugins = {
      };
    };
  };
  programs.vesktop = {
    enable = true;
    vencord = {
      themes = {
        catppuccin = ./catt+fixes.css;
      };
      settings = {
        enabledThemes = ["catppuccin.css"];
        plugins = {
          AlwaysAnimate.enabled = true;
          ClearURLs.enabled = true;
          CopyStickerLinks.enabled = true;
          Dearrow = {
            enabled = true;
            replaceElements = 1;
          };
          DisableCallIdle.enabled = true;
          DontRoundMyTimestamps.enabled = true;
          Experiments.enabled = true;
          ExpressionCloner.enabled = true;
          FavoriteGifSearch.enabled = true;
          FixImagesQuality.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          FriendsSince.enabled = true;
          FullUserInChatbox.enabled = true;
          GifPaste.enabled = true;
          GreetStickerPicker.enabled = true;
          LoadingQuotes.enabled = true;
          MemberCount.enabled = true;
          MentionAvatars.enabled = true;
          MutualGroupDMs.enabled = true;
          NoDevtoolsWarning.enabled = true;
          NoF1.enabled = true;
          NoProfileThemes.enabled = true;
          NoReplyMention.enabled = true;
          NoUnblockToJump.enabled = true;
          OpenInApp = {
            enabled = true;
            epic = false;
          };
          PlatformIndicators.enabled = true;
          RelationshipNotifier = {
            enabled = true;
            notices = true;
          };
          ReplyTimestamp.enabled = true;
          ReverseImageSearch.enabled = true;
          RoleColorEverywhere.enabled = true;
          SendTimestamps.enabled = true;
          ShowConnections.enabled = true;
          ShowHiddenChannels.enabled = true;
          ShowHiddenThings.enabled = true;
          SilentMessageToggle.enabled = true;
          SilentTyping.enabled = true;
          SortFriendRequests.enabled = true;
          SuperReactionTweaks = {
            enabled = true;
            superReactByDefault = false;
            unlimitedSuperReactionPlaying = true;
            superReactionPlayingLimit = 100;
          };
          Translate.enabled = true;
          TypingIndicator = {
            enabled = true;
            includeMutedChannels = true;
            includeBlockedUsers = true;
          };
          TypingTweaks.enabled = true;
          UnlockedAvatarZoom.enabled = true;
          UserMessagePronouns.enabled = true;
          UserVoiceShow.enabled = true;
          ValidReply.enabled = true;
          ValidUser.enabled = true;
          ViewIcons = {
            enabled = true;
            format = "png";
            imgSize = "4096";
          };
          VoiceDownload.enabled = true;
          VoiceMessages = {
            enabled = true;
            noiseSuppression = false;
            echoCancellation = false;
          };
          VolumeBooster = {
            enabled = true;
            multiplier = 3;
          };
          WhoReacted.enabled = true;
          YoutubeAdblock.enabled = true;
        };
      };
    };
  };
}
