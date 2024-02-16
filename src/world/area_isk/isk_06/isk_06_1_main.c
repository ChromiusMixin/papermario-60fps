#include "isk_06.h"

b32 N(CamAdjustReady) = FALSE;

s32 N(adjust_cam_on_landing)(void) {
    s32 ret = LANDING_CAM_CHECK_SURFACE;

    if (gGameStatusPtr->entryID == isk_06_ENTRY_0) {
        if (!N(CamAdjustReady)) {
            if (!(gPlayerStatus.pos.y > -130.0f)) {
                N(CamAdjustReady) = TRUE;
            } else {
                return LANDING_CAM_ALWAYS_ADJUST;
            }
        }

        if (gPlayerStatus.pos.y > -130.0f) {
            ret = LANDING_CAM_NEVER_ADJUST;
        }
    } else {
        ret = LANDING_CAM_ALWAYS_ADJUST;
    }

    return ret;
}

API_CALLABLE(N(SetupLandingCamAdjust)) {
    phys_set_landing_adjust_cam_check(N(adjust_cam_on_landing));
    return ApiStatus_DONE2;
}

EvtScript N(EVS_ExitWalk_isk_04_2) = EVT_EXIT_WALK(40, isk_06_ENTRY_0, "isk_04", isk_04_ENTRY_2);
EvtScript N(EVS_ExitWalk_isk_04_3) = EVT_EXIT_WALK(40, isk_06_ENTRY_1, "isk_04", isk_04_ENTRY_3);

EvtScript N(EVS_BindExitTriggers) = {
    BindTrigger(Ref(N(EVS_ExitWalk_isk_04_2)), TRIGGER_FLOOR_ABOVE, COLLIDER_deiline, 1, 0)
    BindTrigger(Ref(N(EVS_ExitWalk_isk_04_3)), TRIGGER_FLOOR_ABOVE, COLLIDER_deilie, 1, 0)
    Return
    End
};

EvtScript N(EVS_Main) = {
    Set(GB_WorldLocation, LOCATION_DRY_DRY_RUINS)
    Call(SetSpriteShading, SHADING_ISK_06)
    Call(N(SetupLandingCamAdjust))
    EVT_SETUP_CAMERA_NO_LEAD(0, 0, 0)
    IfLt(GB_StoryProgress, STORY_CH2_DRAINED_SECOND_SAND_ROOM)
        Call(SetZoneEnabled, ZONE_o2016, FALSE)
    Else
        Call(SetZoneEnabled, ZONE_C2, FALSE)
        Call(SetZoneEnabled, ZONE_o2012, FALSE)
    EndIf
    ExecWait(N(EVS_MakeEntities))
    Exec(N(EVS_SetupSand))
    Exec(N(EVS_SetupSwitch))
#if VERSION_PAL
    Call(SetMusicTrack, 0, SONG_DRY_DRY_RUINS, 0, 8)
#else
    Switch(GB_StoryProgress)
        CaseLt(STORY_CH2_SOLVED_ARTIFACT_PUZZLE)
            Call(SetMusicTrack, 0, SONG_DRY_DRY_RUINS, 0, 8)
        CaseLt(STORY_CH2_DEFEATED_TUTANKOOPA)
            Call(SetMusicTrack, 0, SONG_RUINS_BASEMENT, 0, 8)
        CaseGe(STORY_CH2_DEFEATED_TUTANKOOPA)
            Call(SetMusicTrack, 0, SONG_DRY_DRY_RUINS, 0, 8)
    EndSwitch
#endif
    Set(LVar0, Ref(N(EVS_BindExitTriggers)))
    Exec(EnterWalk)
    Return
    End
};
