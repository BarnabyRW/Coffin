using UnityEngine;
using System.Collections;
using Colorful;

public class HueShift : MonoBehaviour {
	private float newHue;
	public float HueSpeed = 1;
	// Use this for initialization
	void Start () {
		newHue = gameObject.GetComponent<HueSaturationValue>().MasterHue = newHue;
	}
	
	// Update is called once per frame
	void Update () {

		gameObject.GetComponent<HueSaturationValue> ().MasterHue = newHue;
		newHue += HueSpeed * Time.deltaTime;
		if (newHue >= 179){
			newHue = -180;
		}
	}
}
