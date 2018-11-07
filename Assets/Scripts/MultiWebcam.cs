using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MultiWebcam : MonoBehaviour {


    public Renderer[] target;

    public WebCamDevice[] devices;

    void Start()
    {
        for (int i = 0; i < target.Length; i++)
        {
            devices = WebCamTexture.devices;

            WebCamTexture webcamTexture = new WebCamTexture();

            if (devices.Length > 0)
            {
                webcamTexture.deviceName = devices[i].name;

                target[i].material.mainTexture = webcamTexture;


                webcamTexture.Play();

            }

        }
    }
}
